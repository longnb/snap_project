module ImagesHelper

	def toggle_like_button(image, user)
		if user.flagged?(image, :like)
			link_to "Unlike",like_image_path(image)
		else 
			link_to "Like", like_image_path(image)
		end
	end
end
