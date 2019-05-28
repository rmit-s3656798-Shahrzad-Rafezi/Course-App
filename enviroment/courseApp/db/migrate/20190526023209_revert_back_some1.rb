class RevertBackSome1 < ActiveRecord::Migration[5.2]
  def change
    create_table "courses", force: :cascade do |t|
      t.bigint "user_id"
      t.string "name"
      t.string "prerequisite"
      t.string "description"
      t.string "image"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id"], name: "index_courses_on_user_id"
    end
  end
end
