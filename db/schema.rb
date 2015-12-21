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

ActiveRecord::Schema.define(version: 20150920162606) do

  create_table "accesses", force: :cascade do |t|
    t.string   "ip"
    t.integer  "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accesses", ["link_id"], name: "index_accesses_on_link_id"

  create_table "links", force: :cascade do |t|
    t.string   "origin"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "links", ["slug"], name: "index_links_on_slug", unique: true

  create_table "statistics", force: :cascade do |t|
    t.integer  "link_id"
    t.integer  "visit",        default: 0
    t.integer  "unique_visit", default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "statistics", ["link_id"], name: "index_statistics_on_link_id"

end
