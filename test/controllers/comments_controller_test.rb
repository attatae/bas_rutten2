require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
	#test "should get new" do 
	#	get :event_idnew
	#	assert_response :redirect
	#	assert_redirected_to login_path # EP "TESTING THE STATUSES CONTROLLER"
	#end
	# # DID THIS with events controller test under diff name

	test "should create comment for the current user when logged in" do 
		sign_in users(:chris)

		assert_difference('Event.count') do
			post :create, event: { text: @event.text, user_id: users(:todd).id }
			end

			assert_redirected_to status_path(assigns(:status))
			assert_equal assigns(:event).user_id, users(:event).id
	end
end