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

ActiveRecord::Schema.define(version: 20151022155855) do

  create_table "children", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "nickname"
    t.string   "email"
    t.string   "cellphone"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "parent_name"
    t.text     "family_info"
    t.datetime "bday"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "userid"
    t.integer  "teacher_userid"
    t.integer  "hobbyteach1_userid"
    t.integer  "hobbyteach2_userid"
    t.integer  "hobbyteach3_userid"
    t.float    "old_latitude"
    t.float    "old_longitude"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "hobby_class_sports", force: :cascade do |t|
    t.string   "teachername"
    t.string   "class_name"
    t.string   "teacher_email"
    t.string   "teacher_cell"
    t.integer  "teacher_userid"
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
    t.integer  "school_userid"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "old_latitude"
    t.float    "old_longitude"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.string   "kid_name"
    t.text     "family_info"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "userid"
    t.float    "old_latitude"
    t.float    "old_longitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "public_schools", force: :cascade do |t|
    t.string   "teachername"
    t.string   "grade"
    t.string   "teacher_email"
    t.string   "teacher_cell"
    t.integer  "teacher_userid"
    t.string   "schoolname"
    t.string   "school_district"
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
    t.integer  "school_userid"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "old_latitude"
    t.float    "old_longitude"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "publicschools", force: :cascade do |t|
    t.string   "teachername"
    t.string   "grade"
    t.string   "teacher_email"
    t.string   "teacher_cell"
    t.integer  "teacher_userid"
    t.string   "schoolname"
    t.string   "school_district"
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
    t.integer  "school_userid"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "old_latitude"
    t.float    "old_longitude"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
