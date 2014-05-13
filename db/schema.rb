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

ActiveRecord::Schema.define(version: 20140509014738) do

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "hconferences", force: true do |t|
    t.string   "season"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
    t.string   "date"
    t.string   "location"
    t.integer  "early_price"
    t.integer  "normal_price"
    t.string   "early_date"
    t.string   "normal_date"
    t.string   "late_date"
    t.string   "late_price"
    t.integer  "delegation_fee"
    t.string   "roman"
  end

  add_index "hconferences", ["number"], name: "index_hconferences_on_number", unique: true

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "q"
    t.string   "a"
    t.integer  "hconference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["hconference_id", "created_at"], name: "index_questions_on_hconference_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               default: false
    t.string   "role"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "secretariat",         default: false
    t.string   "sec_pos",             default: "none"
    t.boolean  "travel_team",         default: false
    t.boolean  "home_team",           default: false
    t.string   "bio"
    t.string   "grad_year"
    t.string   "major"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
