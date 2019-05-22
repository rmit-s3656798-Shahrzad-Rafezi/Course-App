class RemoveOldForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key "courses", "categories"
    remove_foreign_key "courses", "locations"
    remove_foreign_key "courses", "users"
    remove_foreign_key "courses", "votes"
    remove_foreign_key "votes", "users"
  end
end
