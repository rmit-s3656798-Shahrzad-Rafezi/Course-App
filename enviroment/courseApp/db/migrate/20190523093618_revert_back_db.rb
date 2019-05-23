class RevertBackDb < ActiveRecord::Migration[5.2]
  def change

    create_table "categories", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "courses", force: :cascade do |t|
      t.string "name"
      t.string "prerequisite"
      t.string "description"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "category_id"
      t.bigint "location_id"
      t.bigint "user_id"
      t.bigint "vote_id"
      t.index ["category_id"], name: "index_courses_on_category_id"
      t.index ["location_id", "vote_id"], name: "index_courses_on_location_id_and_vote_id"
      t.index ["location_id"], name: "index_courses_on_location_id"
      t.index ["user_id", "category_id"], name: "index_courses_on_user_id_and_category_id"
      t.index ["user_id"], name: "index_courses_on_user_id"
      t.index ["vote_id"], name: "index_courses_on_vote_id"
    end
  
    create_table "locations", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
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
      t.string "remember_digest"
      t.boolean "superuser", default: false
      t.index ["email"], name: "index_users_on_email", unique: true
    end
  
    create_table "votes", force: :cascade do |t|
      t.boolean "liked"
      t.boolean "disliked"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "user_id"
      t.index ["user_id"], name: "index_votes_on_user_id"
    end
  
    add_foreign_key "courses", "categories"
    add_foreign_key "courses", "locations"
    add_foreign_key "courses", "users"
    add_foreign_key "courses", "votes"
    add_foreign_key "votes", "users"
    
  end
end
