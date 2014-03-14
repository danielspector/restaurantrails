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

ActiveRecord::Schema.define(version: 20140314153230) do

  create_table "cuisines", force: true do |t|
    t.string "cuisinecode"
    t.string "description"
    t.string "slug"
  end

  add_index "cuisines", ["slug"], name: "index_cuisines_on_slug"

  create_table "restaurant_cuisines", force: true do |t|
    t.integer "cuisine_id"
    t.integer "restaurant_id"
  end

  create_table "restaurant_violations", force: true do |t|
    t.integer "violation_id"
    t.integer "restaurant_id"
  end

  create_table "restaurants", force: true do |t|
    t.string  "name"
    t.integer "building_number"
    t.string  "street_name"
    t.integer "zip"
    t.integer "phone"
    t.string  "date"
    t.integer "cuisinecode"
    t.integer "score"
    t.string  "grade"
    t.string  "slug"
  end

  add_index "restaurants", ["slug"], name: "index_restaurants_on_slug"

  create_table "violations", force: true do |t|
    t.boolean "critical_vio"
    t.string  "vio_code"
    t.string  "description"
  end

end
