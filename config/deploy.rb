require "bundler/capistrano" 
set :application, "codeapp"

set :branch, "master"
set :repository,  "https://github.com/railsfans/codeapp.git"
set :scm, "git"
set :user, "railsfans" # 一個伺服器上的帳戶用來放你的應用程式，不需要有sudo權限，但是需要有權限可以讀取Git repository拿到原始碼
set :port, "22"

set :deploy_to, "/opt/codeapps"
set :deploy_via, :remote_cache
set :use_sudo, false

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.168.1.240"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.240"                          # This may be the same as your `Web` server
role :db,  "192.168.1.240", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
set :deploy_to,        "/opt/#{application}"
set :deploy_via, :remote_cache
 namespace :deploy do
  task :copy_config_files, :roles => [:app] do
    db_config = "#{shared_path}/database.yml"
    run "cp #{db_config} #{release_path}/config/database.yml"
  end
  task :update_symlink do
    run "ln -s #{shared_path}/public/system #{current_path}/public/system"
  end
   task :dev_migrate do
     run "cd /opt/codeapp/current; rake db:migrate"
   end
   task :restart do 
     run "/opt/nginx/sbin/nginx -s reload"
   end
   task :start do 
     run "/opt/nginx/sbin/nginx"
   end
   task :stop do 
     run  "/opt/nginx/sbin/nginx -s stop"
   end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
# after "deploy:update_code", "deploy:copy_config_files" # 如果將database.yml放在shared下，請打開
# after "deploy:finalize_update", "deploy:update_symlink" # 如果有實作使用者上傳檔案到public/system，請打開
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
