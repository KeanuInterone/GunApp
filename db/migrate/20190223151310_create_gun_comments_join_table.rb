class CreateGunCommentsJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :gun_comments, id: false do |t|
    	t.belongs_to :comment, null: false
    	t.belongs_to :gun, null: false
    end
    add_index :gun_comments, [:comment_id, :gun_id], unique: true
  end
end
