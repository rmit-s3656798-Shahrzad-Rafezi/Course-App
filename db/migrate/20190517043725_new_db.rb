class NewDb < ActiveRecord::Migration[5.2]
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
      t.string "categories_id"
      t.string "locations_id"
      t.string "users_id"
      t.string "votes_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  
    create_table "locations", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
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
      t.string "users_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
