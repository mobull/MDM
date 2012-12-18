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

ActiveRecord::Schema.define(:version => 20121217084626) do

  create_table "allowed_actions", :id => false, :force => true do |t|
    t.integer "role_id"
    t.string  "name"
  end

  add_index "allowed_actions", ["role_id"], :name => "index_allowed_actions_on_role_id"

  create_table "contact_lines", :force => true do |t|
    t.integer  "user_id"
    t.string   "category",    :null => false
    t.string   "content",     :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "contact_lines", ["category"], :name => "index_contact_lines_on_category"
  add_index "contact_lines", ["user_id"], :name => "index_contact_lines_on_user_id"

  create_table "device_ownerships", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "devices", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "platform_identifier", :default => "ios", :null => false
    t.integer  "device_ownership_id"
  end

  add_index "devices", ["device_ownership_id"], :name => "index_devices_on_device_ownership_id"
  add_index "devices", ["platform_identifier"], :name => "index_devices_on_platform_identifier"
  add_index "devices", ["user_id"], :name => "index_devices_on_user_id"

  create_table "global_variables", :id => false, :force => true do |t|
    t.string   "name",       :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "global_variables", ["name"], :name => "index_global_variables_on_name"

  create_table "platforms", :id => false, :force => true do |t|
    t.string "identifier"
    t.string "display_name"
  end

  add_index "platforms", ["identifier"], :name => "index_platforms_on_identifier", :unique => true

  create_table "profile_generator_ios_general_payload", :force => true do |t|
    t.boolean  "HasRemovalPasscode"
    t.boolean  "IsEncrypted"
    t.string   "PayloadDescription"
    t.string   "PayloadDisplayName"
    t.boolean  "PayloadRemovalDisallowed"
    t.string   "PayloadType",              :default => "Configuration", :null => false
    t.integer  "PayloadVersion",           :default => 1,               :null => false
    t.boolean  "PayloadScope"
    t.date     "RemovalDate"
    t.float    "DurationUntilRemoval"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.text     "bio"
    t.string   "email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
