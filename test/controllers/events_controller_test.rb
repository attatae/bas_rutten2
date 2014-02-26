require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test "should be redirected when not signed in" do 
  	get :new
  	assert_response :redirect
  	assert_redirected_to new_user_session_path
	end

	test "should render the new page when signed in" do 
		sign_in users(:christopher)
		get :new 
		assert_response :success
	end
end
