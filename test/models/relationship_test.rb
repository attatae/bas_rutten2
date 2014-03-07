require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  should belong_to(:follower)
  should belong_to(:followed)

  test "that the follow relationship works without raising an exception" do 
  	assert_nothing_raised do
  		Relationship.create user: users(:christopher), friend: users(:lana)
  	end
  end

  test "that creating a relationship based on follower id and followed id works" do
  	UserFriendship.create follower_id: users(:christopher).id, followed_id: users(:todd).id
  	assert users(:christopher).friends.include?(users(:todd))
  	end
end
