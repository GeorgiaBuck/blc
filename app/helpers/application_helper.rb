module ApplicationHelper

	# Return a title depending on the page
	def title
		base_title = "BLC"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def ministry_list
		@ministry = Ministry.all
	end

end
