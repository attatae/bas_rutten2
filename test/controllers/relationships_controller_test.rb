require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  context '#new' do  
  	context "when not logged in" do 
  		should "redirect to the login page" do
  			get :new
  			assert_response :redirect
  		end
  	end
  end

  context "when logged in" do
  	setup do
  		sign_in users(:christopher)
  	end

  	should "get new and return success" do 
  		get :new
  		assert_response :success
  	end

  	should "set a flash error if followed_id params is missing" do 
  		get :new, {}
  		assert_equal "Friend required", flash[:error]
  	end

  	should "display the followed user's name" do
  		get :new, followed_id: user(:todd).id 
  		assert_match /#{users(:todd).full_name}/, response.body
  	end

  	should "assign a new user following" do
  		get :new, followed_id: users(:todd).id
  		assert assigns(:relationship)
  	end

  	should "assign a new user following to the correct followee" do
  		get :new, follower_id: users(:todd).id 
  		assert_equal users(:todd), assigns(:relationship).followed
  	end

  	should "assign a new user following to the currently logged in user" do
  		get :new, follower_id: users(:todd).id 
  		assert_equal users(:christopher), assigns(:relationship).follower
  	end

  	should "return a 404 status if no user is found to follow" do 
  		get :new, followed_id: 'invalid'
  		assert_response :not_found
  	end

    #should "ask if you really want to follow the user" do
    #  get :new, followed_id: users(:todd)
    #  assert_match /Do you really want to follow #{users(:todd).full_name?}/,response.body
    #end
  end
end

