class CreateUserFavoritesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorites, id: false do |t|
    	t.belongs_to :user, null: false
    	t.belongs_to :gun, null: false
    end
    add_index :user_favorites, [:user_id, :gun_id], unique: true
  end
end
