class CreateGuns < ActiveRecord::Migration[5.2]
  def change
    create_table :guns do |t|
      t.string :brand
      t.string :name
      t.float :caliber

      t.timestamps
    end
  end
end
