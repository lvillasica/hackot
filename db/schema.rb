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

ActiveRecord::Schema.define(:version => 20131116191758) do

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admins", ["login"], :name => "index_admins_on_login", :unique => true

  create_table "events", :force => true do |t|
    t.integer  "relief_center_id"
    t.integer  "volunteers_needed"
    t.string   "details"
    t.integer  "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "title"
  end

  create_table "relief_centers", :force => true do |t|
    t.string   "identifier"
    t.string   "name"
    t.string   "password"
    t.string   "description"
    t.decimal  "latitude",    :precision => 15, :scale => 10
    t.decimal  "longitude",   :precision => 15, :scale => 10
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
  end

  add_index "relief_centers", ["identifier"], :name => "index_relief_centers_on_identifier", :unique => true

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "skills", ["name"], :name => "index_skills_on_name", :unique => true

  create_table "skills_users", :id => false, :force => true do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  add_index "skills_users", ["user_id", "skill_id"], :name => "index_skills_users_on_user_id_and_skill_id", :unique => true

  create_table "timelogs", :force => true do |t|
    t.integer  "user_id"
    t.datetime "timein"
    t.datetime "timeout"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "password"
    t.string   "mobile"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.integer  "relief_center_id"
  end

  add_index "users", ["mobile"], :name => "index_users_on_mobile", :unique => true

end
