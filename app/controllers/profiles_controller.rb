class ProfilesController < ApplicationController
	def show
    @user = User.find_by_profile_name(params[:id])
    if @user
			@events = Event.all 
			#@events = @user.events.all
			#gets undefined method 'events' for #<User:0x5760630>    
      render action: :show
    else
      render file: 'public/404', event: 404, formats: [:html]
    end
  end
end


