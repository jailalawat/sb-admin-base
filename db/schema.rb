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

ActiveRecord::Schema.define(version: 20180321080107) do

  create_table "clocks", force: true do |t|
    t.date     "date"
    t.string   "user"
    t.string   "ip"
    t.string   "action"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.datetime "time"
  end

  create_table "photos", force: true do |t|
    t.string   "title"
    t.text     "image_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_images", force: true do |t|
  end

  create_table "preset_categories", force: true do |t|
    t.string   "title"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presets", force: true do |t|
    t.string   "title"
    t.string   "path",                       null: false
    t.integer  "category_id"
    t.boolean  "status",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "group"
    t.string   "key"
    t.string   "value"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "transcripts", force: true do |t|
    t.string   "content"
    t.string   "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "fullName"
    t.string   "department"
    t.string   "position"
    t.string   "email"
    t.string   "password"
    t.string   "activeKey"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.integer  "status",     default: 0, null: false
  end

end
