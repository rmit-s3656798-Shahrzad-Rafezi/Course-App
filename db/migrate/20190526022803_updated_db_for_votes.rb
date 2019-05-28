class UpdatedDbForVotes < ActiveRecord::Migration[5.2]
  def change
    create_table "votes", force: :cascade do |t|
      t.bigint "course_id "
      t.bigint "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
