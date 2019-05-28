class Removevote < ActiveRecord::Migration[5.2]
  def change
    create_table "courses", force: :cascade do |t|
      t.string "name"
      t.string "prerequisite"
      t.string "description"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "category_id"
      t.integer "location_id"
      t.integer "user_id"
      t.integer "vote_id"
    end
  end
end
