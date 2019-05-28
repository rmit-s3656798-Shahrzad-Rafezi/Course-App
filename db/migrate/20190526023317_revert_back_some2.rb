class RevertBackSome2 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key "courses", "users"
  end
end
