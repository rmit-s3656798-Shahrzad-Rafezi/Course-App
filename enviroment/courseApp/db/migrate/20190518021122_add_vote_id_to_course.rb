class AddVoteIdToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :vote_id, :integer
  end
end
