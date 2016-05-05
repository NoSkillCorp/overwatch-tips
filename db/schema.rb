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

ActiveRecord::Schema.define(version: 20160505145015) do

  create_table "gaming_objects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_path"
  end

  create_table "tips", force: :cascade do |t|
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "gaming_object_id"
    t.string   "category"
  end

  add_index "tips", ["gaming_object_id"], name: "index_tips_on_gaming_object_id"

  create_table "votes", force: :cascade do |t|
    t.integer  "weight"
    t.integer  "tip_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "user_cookie"
  end

  add_index "votes", ["tip_id", "user_cookie"], name: "index_votes_on_tip_id_and_user_cookie"
  add_index "votes", ["tip_id"], name: "index_votes_on_tip_id"

end
