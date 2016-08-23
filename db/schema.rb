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

ActiveRecord::Schema.define(version: 20160823104027) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "gaming_objects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_path"
    t.string   "slug"
    t.index ["slug"], name: "index_gaming_objects_on_slug", unique: true
  end

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
    t.index ["gaming_object_id"], name: "index_tips_on_gaming_object_id"
    t.index ["user_cookie"], name: "index_tips_on_user_cookie"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_cookie"
    t.string   "ip_adress"
    t.string   "user_agent"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_registered",       default: false
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_cookie"], name: "index_users_on_user_cookie"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "weight"
    t.integer  "tip_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "user_cookie"
    t.index ["tip_id", "user_cookie"], name: "index_votes_on_tip_id_and_user_cookie"
    t.index ["tip_id"], name: "index_votes_on_tip_id"
    t.index ["user_cookie"], name: "index_votes_on_user_cookie"
  end

end
