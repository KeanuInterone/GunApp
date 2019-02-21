class Gun < ApplicationRecord
	has_one_attached :image
	belongs_to :brand, optional: true
	has_and_belongs_to_many :favored_by, class_name: :User, join_table: "user_favorites"

	def thumbnail
		return self.image.variant(resize: "100x100").processed
	end
end
