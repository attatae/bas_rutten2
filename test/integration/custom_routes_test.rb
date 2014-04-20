require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "that /signin route opens the signin page" do 
  	get '/signin'
  	assert_response :success
  end

  test "that /signup route opens the signup page" do 
  	get '/signup'
  	assert_response :success
  end
end
