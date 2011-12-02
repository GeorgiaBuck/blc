class SessionsController < ApplicationController
  def new
		@title = "Sign in"
  end

	def create
		user = User.authenticate(params[:session][:email],
															params[:session][:password])
		if user.nil?
			flash.now[:error] = "You must be a member of our class and you have to 
													enter your email address and password just as you 
													entered them when you signed in. If you have not previously 
													signed up, please click on the _Sign_up_Now link below." 
			@title = "Sign Up"
			render 'new'
		else
			sign_in user
			redirect_to user
		end
	end
	
	def destroy
		sign_out
		redirect_to :home
	end
end
