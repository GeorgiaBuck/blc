require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
   
	  @input_attributes = {
			:first_name			=> 'George',
			:last_name			=> 'Washington',
			:email					=> 'lauren@gmail.com',
			:address_id					=> '123 East Gate',
			:password				=> "private",
			:password_confirmation => "private"
		}
		
		@member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, :member => @input_attributes
    end

    assert_redirected_to members_path
  end

  test "should show member" do
    get :show, :id => @member.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @member.to_param
    assert_response :success
  end

  test "should update member" do
    put :update, :id => @member.to_param, :member => @input_attributes
    assert_redirected_to members_path
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, :id => @member.to_param
    end

    assert_redirected_to members_path
  end
end
