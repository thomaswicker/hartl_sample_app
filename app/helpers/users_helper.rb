module UsersHelper

		# Returns the Gravatar for a given user.

		def gravatar_for(user)
			# Digest::MD5::hexdigest(user.email) encrpts the email passed in and returns as a hexidecimal string, then pass that to the interpolated gravatar_id in the gravatar_url, then pass that whole object into the image_tag for final output to the view. We downcase the user.email because the MD5 hash result is case senstive so USER@email.com and user@email.com return different users.
			gravatar_id = Digest::MD5::hexdigest(user.email.downcase) 
			gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
			image_tag(gravatar_url, alt: user.name, class: "gravatar")
		end
end
