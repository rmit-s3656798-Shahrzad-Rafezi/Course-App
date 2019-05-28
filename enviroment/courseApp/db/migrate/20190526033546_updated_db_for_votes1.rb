class UpdatedDbForVotes1 < ActiveRecord::Migration[5.2]
  def change
    create_table "votes", force: :cascade do |t|
      t.references :course, foreign_key: true
      t.boolean "type"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
