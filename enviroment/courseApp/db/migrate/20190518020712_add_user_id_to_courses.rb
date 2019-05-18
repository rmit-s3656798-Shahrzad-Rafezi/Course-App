class AddUserIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :user_id, :integer
  end
end
