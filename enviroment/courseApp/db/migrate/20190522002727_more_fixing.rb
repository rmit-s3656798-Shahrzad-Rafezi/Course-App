class MoreFixing < ActiveRecord::Migration[5.2]
  def change
    create_table "votes", force: :cascade do |t|
      t.boolean "liked"
      t.boolean "disliked"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.references :user, foreign_key: true      
    end
  end
end
