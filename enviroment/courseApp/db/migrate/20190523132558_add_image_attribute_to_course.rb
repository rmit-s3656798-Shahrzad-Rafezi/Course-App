class AddImageAttributeToCourse < ActiveRecord::Migration[5.2]
  def change

    create_table "courses", force: :cascade do |t|
      t.string "name"
      t.string "prerequisite"
      t.string "description"
      t.string "image"
      t.bigint "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

  end
end
