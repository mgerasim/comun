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

ActiveRecord::Schema.define(:version => 20121204120412) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "smsmail"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients_groups", :force => true do |t|
    t.integer "client_id"
    t.integer "group_id"
  end

  add_index "clients_groups", ["client_id"], :name => "index_clients_groups_on_client_id"
  add_index "clients_groups", ["group_id"], :name => "index_clients_groups_on_group_id"

  create_table "group_clients", :force => true do |t|
    t.integer  "group_id"
    t.integer  "client_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "group_clients", ["client_id"], :name => "index_group_clients_on_client_id"
  add_index "group_clients", ["group_id"], :name => "index_group_clients_on_group_id"

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "client_id"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["client_id"], :name => "index_messages_on_client_id"

end
