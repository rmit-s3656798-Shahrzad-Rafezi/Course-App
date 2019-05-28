class CreateCategoriesCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_courses do |t|
      t.references :course, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
