class AddIndexFavoritesBook < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, [:book_id, :user_id], unique: true
  end
end
