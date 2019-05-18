class AnyMigration2 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :votes, :users
  end
end
