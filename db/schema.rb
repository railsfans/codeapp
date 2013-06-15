# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130615143922) do

  create_table "boys", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "codes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "parent_id"
    t.text     "describe"
    t.string   "footprint"
    t.string   "manufacturer"
    t.string   "partNum"
    t.integer  "quantity"
    t.float    "unitprice"
    t.text     "comment"
    t.boolean  "codeLength",   :default => true
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "menberships", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "code_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "company"
    t.string   "address"
    t.string   "website"
    t.string   "contactor"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
