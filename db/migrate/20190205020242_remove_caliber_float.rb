class RemoveCaliberFloat < ActiveRecord::Migration[5.2]
  def change
  	remove_column :guns, :caliber
  end
end
