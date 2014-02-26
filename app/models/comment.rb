class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  #FOR SOME REASON the below won't say anything, but do disallow user as needed :/
  validates :user_id, presence: true
  validates :body, presence: true,
  								 length: { minimum: 2 }
end
