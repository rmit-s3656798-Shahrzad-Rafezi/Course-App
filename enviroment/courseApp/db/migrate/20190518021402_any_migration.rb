class AnyMigration < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :courses, :categories
    add_foreign_key :courses, :users
    add_foreign_key :courses, :votes
    add_foreign_key :courses, :locations
  end
end
