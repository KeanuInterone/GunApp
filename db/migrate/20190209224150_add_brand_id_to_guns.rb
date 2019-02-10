class AddBrandIdToGuns < ActiveRecord::Migration[5.2]
  def change
  	add_column :guns, :brand_id, :integer
  end
end
