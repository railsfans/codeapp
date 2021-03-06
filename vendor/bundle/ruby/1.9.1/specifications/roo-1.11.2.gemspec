# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "roo"
  s.version = "1.11.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Preymesser", "Hugh McGowan", "Ben Woosley"]
  s.date = "2013-04-10"
  s.description = "Roo can access the contents of various spreadsheet files. It can handle\n* Openoffice\n* Excel\n* Google spreadsheets\n* Excelx\n* Libreoffice\n* CSV"
  s.email = "ruby.ruby.ruby.roo@gmail.com"
  s.extra_rdoc_files = ["LICENSE", "README.markdown", "TODO"]
  s.files = ["LICENSE", "README.markdown", "TODO"]
  s.homepage = "http://github.com/Empact/roo"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0")
  s.rubyforge_project = "roo"
  s.rubygems_version = "1.8.25"
  s.summary = "Roo can access the contents of various spreadsheet files."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spreadsheet>, ["> 0.6.4"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<spreadsheet>, ["> 0.6.4"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<rubyzip>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<spreadsheet>, ["> 0.6.4"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<rubyzip>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end
