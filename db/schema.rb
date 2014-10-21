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

ActiveRecord::Schema.define(:version => 20141021184255) do

  create_table "apis", :force => true do |t|
    t.string   "name"
    t.string   "api_key"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "irc_users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "irc_users", ["name"], :name => "index_irc_users_on_name", :unique => true

  create_table "links", :force => true do |t|
    t.string   "url"
    t.integer  "irc_user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "show_id"
  end

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.integer  "show_id"
    t.integer  "irc_user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "shows", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "titles_count"
    t.integer  "episode_number"
  end

  create_table "titles", :force => true do |t|
    t.string   "title"
    t.string   "title_lc"
    t.datetime "created_at",                 :null => false
    t.integer  "irc_user_id"
    t.datetime "updated_at",                 :null => false
    t.integer  "show_id"
    t.integer  "votes_count", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "admin"
    t.string   "remember_token"
  end

  create_table "votes", :force => true do |t|
    t.string   "voterip"
    t.integer  "title_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
