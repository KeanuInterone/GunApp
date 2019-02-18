module GunsHelper

	def gun_brand_link(gun)
		if gun.brand_id
			link_to gun.brand.name, gun.brand 
		else
			"Brand Unknown"
		end
	end

	def gun_image(gun)

		if gun.image.attached?
			return image_tag gun.thumbnail
		else
			return image_tag 'default_gun_image.png'
		end 

	end


end
