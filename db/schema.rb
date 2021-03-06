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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140202175646) do

  create_table "connections", force: true do |t|
    t.integer  "user_id"
    t.integer  "provider_cd", default: 0,  null: false
    t.string   "identity",    default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "connections", ["provider_cd"], name: "index_connections_on_provider_cd"
  add_index "connections", ["user_id", "provider_cd"], name: "by_user_and_provider", unique: true
  add_index "connections", ["user_id"], name: "index_connections_on_user_id"

  create_table "keychains", force: true do |t|
    t.integer  "user_id"
    t.string   "api_secret",   null: false
    t.string   "api_token",    null: false
    t.string   "oauth_secret"
    t.string   "oauth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keychains", ["user_id"], name: "index_keychains_on_user_id"

  create_table "stats", force: true do |t|
    t.integer  "connection_id", default: 0,  null: false
    t.integer  "type_cd",       default: 0,  null: false
    t.text     "event",         default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stats", ["connection_id", "type_cd"], name: "index_stats_on_connection_id_and_type_cd"
  add_index "stats", ["connection_id"], name: "index_stats_on_connection_id"
  add_index "stats", ["type_cd"], name: "index_stats_on_type_cd"

  create_table "users", force: true do |t|
    t.string   "provider",            default: "", null: false
    t.string   "uid",                 default: "", null: false
    t.string   "name",                default: ""
    t.string   "image",               default: ""
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["nickname"], name: "index_users_on_nickname"

end
