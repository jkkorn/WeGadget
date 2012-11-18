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

ActiveRecord::Schema.define(:version => 20121117181539) do

  create_table "categories", :force => true do |t|
    t.integer  "category_id"
    t.string   "name",        :default => "", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "categories", ["category_id"], :name => "index_categories_on_category_id"

  create_table "tags", :force => true do |t|
    t.string   "name",       :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "tags_tutorials", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "tutorial_id"
  end

  add_index "tags_tutorials", ["tag_id", "tutorial_id"], :name => "index_tags_tutorials_on_tag_id_and_tutorial_id"

  create_table "tutorials", :force => true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.string   "title",       :default => "", :null => false
    t.string   "subtitle",    :default => ""
    t.text     "description",                 :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "tutorials", ["category_id"], :name => "index_tutorials_on_category_id"
  add_index "tutorials", ["user_id"], :name => "index_tutorials_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
