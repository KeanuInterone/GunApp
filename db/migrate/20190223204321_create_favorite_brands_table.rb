class CreateFavoriteBrandsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_brands, id: false do |t|
    	t.belongs_to :user, null: false
    	t.belongs_to :brand, null: false
    end
    add_index :favorite_brands, [:user_id, :brand_id], unique: true
  end
end
