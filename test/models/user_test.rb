require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test "a user should enter a first name" do
		user = User.new
		assert !user.save
		assert !user.errors[:first_name].empty?
	end
end

	test "a user should enter a last name" do
		user = User.new
		assert !user.save
		assert !user.errors[:last_name].empty?
	end

	#test "a user can have a correctly formatted profile name" do 
	#	user = User.new(first_name: 'Christopher', last_name: 'de Alba', email: 'cjdealba2@yahoo.net')
	#	user.password = user.password_confirmation = 'p4$$w0rd'

	#	user.profile_name = 'hippocampus661'
	#	assert user.valid?
	#end
end
