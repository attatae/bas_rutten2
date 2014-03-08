class RelationshipsController < ApplicationController
	#before_filter :authentication_user!, only:[:new]
	before_action :signed_in_user

  #def create
  #  @user = User.find(params[:relationship][:followed_id])
  #  current_user.follow!(@user)
  #  redirect_to @user
  #end

  #def destroy
  #  @user = Relationship.find(params[:id]).followed
  #  current_user.unfollow!(@user)
  #  redirect_to @user
  #end
#end

	def new
		if params[:followed_id]
			@followed = User.find(params[:followed_id])
			@relationship = current_user.user_relationships.new(friend: @friend)
		else
			flash[:error] = "Requires someone someone to follow"
		end
	rescue ActiveRecord::RecordNotFound
  	render file: 'public/404', status: :not_found
  end 
end
