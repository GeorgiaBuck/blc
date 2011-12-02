class ApplicationController < ActionController::Base
  protect_from_forgery

	include SessionsHelper

	def help
		@title = "Help"
	end
end
