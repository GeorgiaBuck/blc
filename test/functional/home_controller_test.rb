require 'test_helper'

class HomeControllerTest < ActionController::TestCase
	setup do
    @input_attributes = {
			:last_name							=> "sam",
			:password								=> "private",
			:password_confirmation 	=> "private",
			:email									=> "george@example.com",
			:image									=> "default.jpg",
			:address								=> "101 Main Street"
			}
			@user = users(:one)
		end
	
  test "should get index" do
    get :index
    assert_response :success
  end

end
