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

ActiveRecord::Schema.define(version: 20141127043826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.integer  "question_id"
  end

  create_table "badges", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "color"
    t.string   "desc"
    t.integer  "user_id"
    t.string   "text_color"
  end

  create_table "branches", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "letter"
  end

  create_table "cconferences", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.string   "season"
    t.string   "year"
    t.string   "date"
  end

  create_table "events", force: true do |t|
    t.string   "activity"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "schedule_id"
    t.date     "date"
    t.time     "time_end"
    t.time     "time_start"
  end

  create_table "faqs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "hconference_id"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "frontpages", force: true do |t|
    t.string   "side"
    t.string   "bg_color"
    t.string   "title"
    t.string   "description"
    t.string   "link_href"
    t.string   "link_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bg_image_file_name"
    t.string   "bg_image_content_type"
    t.integer  "bg_image_file_size"
    t.datetime "bg_image_updated_at"
    t.string   "greeting"
    t.string   "image_url"
  end

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

  add_index "hconferences", ["number"], name: "index_hconferences_on_number", unique: true, using: :btree

  create_table "headlines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "title"
    t.integer  "order"
    t.integer  "branch_id"
    t.string   "button_text"
    t.string   "button_url"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faq_id"
    t.string   "content"
  end

  create_table "schedules", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hconference_id"
    t.string   "name"
    t.integer  "branch_id"
    t.date     "date"
  end

  create_table "tconferences", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "season"
    t.string   "year"
    t.string   "location"
    t.string   "date"
    t.string   "host"
    t.string   "slug"
    t.string   "nick"
  end

  add_index "tconferences", ["slug"], name: "index_tconferences_on_slug", using: :btree

  create_table "topics", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "committee"
    t.text     "topic"
    t.text     "image_url"
    t.text     "guide_filename"
    t.string   "chair"
    t.string   "vice_chair"
    t.text     "description"
    t.integer  "training_id"
    t.integer  "hconference_id"
    t.integer  "cconference_id"
  end

  create_table "trainings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               default: false
    t.string   "role",                default: "user"
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
