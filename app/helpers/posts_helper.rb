module PostsHelper
	def liked(post, user)
		html = ""
		if Like.where(["post_id = ? AND user_id = ?", post, user]).exists?
			html << "<p>#{link_to t('unlike'), unlike_post_path(post)}</p>"
		else
			html << "#{link_to t('like'), like_post_path(post)}"
		end
		html.html_safe
	end

	def likers(likers_array)
		html = ""
		unless likers_array.count == 0
			if likers_array.count == 1
				html << "#{likers_array.to_sentence} likes this."
			else
				html << "#{likers_array.to_sentence} like this."
			end
		end
		html.html_safe
	end
end