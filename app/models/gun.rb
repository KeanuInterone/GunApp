class Gun < ApplicationRecord
	has_one_attached :image
	belongs_to :brand, optional: true

	def thumbnail
		return self.image.variant(resize: "100x100").processed
	end
end
