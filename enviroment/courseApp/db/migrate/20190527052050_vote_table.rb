class VoteTable < ActiveRecord::Migration[5.2]
  def change
    create_table "votes", force: :cascade do |t|
      t.bigint "course_id"
      t.references :user, foreign_key: true
      t.boolean "type"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["course_id"], name: "index_votes_on_course_id"
    end
  end
end
