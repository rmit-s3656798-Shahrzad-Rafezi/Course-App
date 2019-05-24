class AddImageToCourseTable < ActiveRecord::Migration[5.2]
  def change
    create_table "courses", force: :cascade do |t|
      t.string "name"
      t.string "prerequisite"
      t.string "description"
      t.string "image"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "category_id"
      t.bigint "location_id"
      t.bigint "vote_id"
      t.integer "user_id"
      t.index ["category_id"], name: "index_courses_on_category_id"
      t.index ["location_id", "vote_id"], name: "index_courses_on_location_id_and_vote_id"
      t.index ["location_id"], name: "index_courses_on_location_id"
      t.index ["user_id", "category_id"], name: "index_courses_on_user_id_and_category_id"
      t.index ["user_id"], name: "index_courses_on_user_id"
      t.index ["vote_id"], name: "index_courses_on_vote_id"
    end
  end
end
