class HomeController < ApplicationController
  def index
		@ministry = Ministry.all
	end
	
	def title
		@title = "Home"
	end
	
	def minlist
		render(:layout => 'minlist')
	end
	
	def announce
		render(:layout => 'announce')
	end

end
