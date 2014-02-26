require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "that an event requires content" do 
  	event = Event.new
  	assert !event.valid?
  	assert !event.errors[:text].empty?
  end

  test "that an event's text is at least 2 letters" do 
  	event = Event.new
  	event.text = "H"
  	assert !event.save
  	assert !event.errors[:text].empty?
  end

  #test "that an event has a user id" do 
  #	event = Event.new
  #	event.text = "Hello"
  #	assert !event.save
  #	assert !event.errors[:user_id].empty?
  #end
end
