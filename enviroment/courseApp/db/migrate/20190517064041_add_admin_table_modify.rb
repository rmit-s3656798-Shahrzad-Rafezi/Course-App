class AddAdminTableModify < ActiveRecord::Migration[5.2]
  def change
    create_table "superusers", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.string "users_id"
      t.string "votes_id"
      t.string "courses_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "password_digest"
    end
  end
end
