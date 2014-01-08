module ApplicationHelper

	def url_to_image(s)
		s.gsub! /\s(http:\/\/.*(\.(png|jpg)))/, '<p><img src="\1"/></p>'
		s.html_safe
	end
	
	def url_to_link(s)
		s.gsub! /\s(http:\/\/.*)/, '<a href="\1">\1</a>'
		s.html_safe
	end

end
