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

ActiveRecord::Schema.define(version: 20131231235419) do

  create_table "mixtapes", force: true do |t|
    t.text     "player_html"
    t.text     "content"
    t.string   "title"
    t.string   "download_link"
    t.string   "tags"
    t.boolean  "explicit",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.integer  "pictureable_id"
    t.string   "pictureable_type"
    t.string   "path"
    t.text     "caption"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_contents", force: true do |t|
    t.integer "post_id"
    t.integer "position"
    t.integer "content_id"
    t.string  "content_type"
  end

  create_table "posts", force: true do |t|
    t.integer  "project_id"
    t.text     "preview"
    t.text     "content_html"
    t.string   "title"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "preview"
    t.string   "download_link"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texts", force: true do |t|
    t.integer "post_id"
    t.text    "text"
    t.integer "position"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videos", force: true do |t|
    t.integer  "videoable_id"
    t.string   "videoable_type"
    t.string   "path"
    t.text     "caption"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
