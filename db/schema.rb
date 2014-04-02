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

ActiveRecord::Schema.define(version: 20140402150039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisine_zipcodes", force: true do |t|
    t.integer "cuisine_id"
    t.integer "zipcode_id"
  end

  create_table "cuisines", force: true do |t|
    t.string "cuisinecode"
    t.string "description"
    t.string "slug"
  end

  add_index "cuisines", ["slug"], name: "index_cuisines_on_slug", using: :btree

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
    t.decimal "phone"
    t.integer "cuisinecode"
    t.integer "score"
    t.string  "grade"
    t.string  "slug"
    t.integer "zipcode_id"
    t.date    "date"
  end

  add_index "restaurants", ["slug"], name: "index_restaurants_on_slug", using: :btree

  create_table "user_cuisines", force: true do |t|
    t.integer "user_id"
    t.integer "cuisine_id"
  end

  create_table "user_restaurants", force: true do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
  end

  create_table "user_violations", force: true do |t|
    t.integer "user_id"
    t.integer "violation_id"
  end

  create_table "user_zipcodes", force: true do |t|
    t.integer "user_id"
    t.integer "zipcode_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "facebook_id"
    t.string   "location"
    t.string   "image_url"
    t.string   "password_digest"
  end

  create_table "violations", force: true do |t|
    t.boolean "critical_vio"
    t.string  "vio_code"
    t.text    "description"
    t.string  "end_date"
  end

  create_table "zipcodes", force: true do |t|
    t.string "zip"
  end

end
