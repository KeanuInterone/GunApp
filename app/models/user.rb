class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness: true
	has_and_belongs_to_many :favorite_guns, class_name: :Gun, join_table: "user_favorites"
	has_and_belongs_to_many :favorite_brands, class_name: :Brand, join_table: "favorite_brands"
end
