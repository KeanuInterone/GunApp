class RemoveBrandStringColumn < ActiveRecord::Migration[5.2]
  def change
  	remove_column :guns, :brand
  end
end
