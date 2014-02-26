class CommentsController < ApplicationController
before_filter :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
#added destroy, not in Treebook 

	def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(params[:comment].permit( :body, :user, :user_id, :first_name))
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to event_path(@event)
  end
end

#each request for a comment has to keep track of the post to which the comment is attached, thus the initial call to the find method of the Post model to get the post in question.


#The destroy action will find the post we are looking at, locate the comment within the @post.comments collection, and then remove it from the database and send us back to the show action for the post.