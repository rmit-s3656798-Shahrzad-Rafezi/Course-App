class AddCategoryIdToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :category_id, :integer
  end
end
