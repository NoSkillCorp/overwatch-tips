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

ActiveRecord::Schema.define(version: 20160612133700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
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

  create_table "gaming_objects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_path"
    t.string   "slug"
  end

  add_index "gaming_objects", ["slug"], name: "index_gaming_objects_on_slug", unique: true, using: :btree

  create_table "meta_characters", force: :cascade do |t|
    t.integer  "strong_character_id"
    t.integer  "weak_character_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "tips", force: :cascade do |t|
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "gaming_object_id"
    t.string   "category"
    t.string   "user_cookie"
  end

  add_index "tips", ["gaming_object_id"], name: "index_tips_on_gaming_object_id", using: :btree
  add_index "tips", ["user_cookie"], name: "index_tips_on_user_cookie", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_cookie"
    t.string   "ip_adress"
    t.string   "user_agent"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "users", ["user_cookie"], name: "index_users_on_user_cookie", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "weight"
    t.integer  "tip_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "user_cookie"
  end

  add_index "votes", ["tip_id", "user_cookie"], name: "index_votes_on_tip_id_and_user_cookie", using: :btree
  add_index "votes", ["tip_id"], name: "index_votes_on_tip_id", using: :btree
  add_index "votes", ["user_cookie"], name: "index_votes_on_user_cookie", using: :btree

  add_foreign_key "tips", "gaming_objects"
  add_foreign_key "votes", "tips"
end
