require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

	setup do
		@input_attributes = {
			:email                	=> "george@example.com",
			:password								=> "private",
			:password_confirmation	=> "private"
		}
		@user = users(:one)
	end

  test "should get new" do
    get :new
    assert_response :success
  end

	test "should have the right title" do
		
	end
	
	test "should have signout path" do
	end

end
