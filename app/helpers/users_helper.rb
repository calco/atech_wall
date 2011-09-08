module UsersHelper
	def language(user)
		html = ""
		if user.user_language == "en"
			html << "English"
		else
			html << "Arabic"
		end
		html
	end
end
