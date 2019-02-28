class Brand < ApplicationRecord
	has_many :guns
	has_and_belongs_to_many :favored_by, class_name: :User, join_table: "favorite_brands"

end
