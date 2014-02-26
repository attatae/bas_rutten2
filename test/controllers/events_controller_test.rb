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

	test "should be logged in to post an event" do 
		post :create, event: { content: "Hello"}
		assert_response :redirect
		assert_redirected_to new_user_session_path
	end

	#test "should get edit when signed in" do 
	#	sign_in users(:christopher)
	#	get :edit, id: @event 
	#	assert_response :success
	#end

	#test "should redirect event update when signed in" do
	#	put :update, id: @event, event: { content: @event.content }
	#	assert_response :redirect 
	#	assert_redirected_to new_user_session_path
	#end

	#test "should create event when logged in" do 
	#	sign_in users(:christopher)
	#	
	#	assert_difference('Event.count') do
	#		post :create, event: { title: @event.title }
	#	end
	#end
end

