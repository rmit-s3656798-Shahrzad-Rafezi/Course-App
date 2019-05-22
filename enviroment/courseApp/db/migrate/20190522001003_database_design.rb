class DatabaseDesign < ActiveRecord::Migration[5.2]
  def change
    create_table "courses", force: :cascade do |t|
      t.string "name"
      t.string "prerequisite"
      t.string "description"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.references :category, foreign_key: true
      t.references :location, foreign_key: true
      t.references :user, foreign_key: true
      t.references :vote, foreign_key: true
    end
    add_index :courses, [:user_id, :category_id]
    add_index :courses, [:location_id, :vote_id]
  end
end
