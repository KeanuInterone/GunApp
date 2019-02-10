module GunsHelper

	def gun_brand_link(gun)
		if gun.brand_id
			link_to gun.brand.name, gun.brand 
		else
			"Brand Unknown"
		end
	end

end
