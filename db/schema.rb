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

ActiveRecord::Schema.define(:version => 20131010200220) do

  create_table "irc_users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shows", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "titles", :force => true do |t|
    t.string   "title"
    t.string   "title_lc"
    t.datetime "created_at", :null => false
    t.integer  "ircuser_id"
    t.datetime "updated_at", :null => false
    t.integer  "show_id"
  end

  create_table "votes", :force => true do |t|
    t.string   "voterip"
    t.integer  "title_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
