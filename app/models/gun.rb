class Gun < ApplicationRecord
	has_one_attached :image
	belongs_to :brand, optional: true
end
