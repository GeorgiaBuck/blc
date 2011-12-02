module UsersHelper
	def name
		name = @user[:first_name] + " " + @user[:last_name]
		@name = name
	end
	
end
