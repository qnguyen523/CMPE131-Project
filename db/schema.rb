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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160423013617) do

  create_table "goals", force: :cascade do |t|
    t.string   "Goal"
    t.text     "Description"
    t.date     "Date"
    t.date     "DueDate"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "signups", force: :cascade do |t|
    t.string   "screen_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "confirm_password"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string   "requirement"
    t.integer  "completionTime"
    t.integer  "goal_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "to_dos", force: :cascade do |t|
    t.string   "task"
    t.text     "description"
    t.integer  "time"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
=======
ActiveRecord::Schema.define(version: 20160901165608) do

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
>>>>>>> parent of bb56238... upload
  end

end
