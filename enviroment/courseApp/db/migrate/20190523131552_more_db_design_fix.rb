class MoreDbDesignFix < ActiveRecord::Migration[5.2]
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
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
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
  end
end
