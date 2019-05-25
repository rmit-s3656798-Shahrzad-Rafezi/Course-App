class CreateCoursesLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_locations do |t|
      t.references :location, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
