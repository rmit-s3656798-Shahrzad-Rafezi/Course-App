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

ActiveRecord::Schema.define(version: 2019_05_18_011539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "courses_id"
    t.index ["courses_id"], name: "index_categories_on_courses_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "prerequisite"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "courses_id"
    t.index ["courses_id"], name: "index_locations_on_courses_id"
  end

  create_table "superusers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.boolean "liked"
    t.boolean "disliked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "courses_id"
    t.index ["courses_id"], name: "index_votes_on_courses_id"
    t.index ["users_id"], name: "index_votes_on_users_id"
  end

  add_foreign_key "locations", "courses", column: "courses_id"
  add_foreign_key "votes", "courses", column: "courses_id"
  add_foreign_key "votes", "users", column: "users_id"
end
