module BrandsHelper

	def gun_image(gun)

		if gun.image.attached?
			return image_tag gun.thumbnail
		else
			return image_tag 'default_gun_image.png'
		end 

	end
	
end
