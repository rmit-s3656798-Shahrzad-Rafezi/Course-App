class RedoCourseTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :courses, force: :cascade
    create_table :courses do |t|
      t.belongs_to :user, foreign_key: true
      t.string "name"
      t.string "prerequisite"
      t.string "description"
      t.string "image"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
