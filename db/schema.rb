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

ActiveRecord::Schema.define(version: 20151106151940) do

  create_table "children", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "nickname"
    t.string   "parent_name"
    t.integer  "parent_id"
    t.text     "family_info"
    t.text     "bdaymonth"
    t.boolean  "bdaywkone"
    t.boolean  "bdaywktwo"
    t.boolean  "bdaywkthree"
    t.boolean  "bdaywkfour"
    t.string   "hobbyteachone"
    t.string   "hobbyteachtwo"
    t.string   "hobbyteachthree"
    t.string   "hobbyteachfour"
    t.float    "old_latitude"
    t.float    "old_longitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "families", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "playfriend_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "cellphone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.text     "family_info"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "old_latitude"
    t.float    "old_longitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "school_hobbies", force: :cascade do |t|
    t.string   "teachername"
    t.string   "class_name"
    t.string   "grade"
    t.string   "teacher_email"
    t.string   "teacher_cell"
    t.string   "schoolname"
    t.string   "school_email"
    t.string   "school_url"
    t.string   "school_phone"
    t.string   "emergency_contactname"
    t.string   "emergency_contactphone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "carpool"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "old_latitude"
    t.float    "old_longitude"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end
end
