class ProfilesController < ApplicationController
	def show
    @user = User.find_by_profile_name(params[:id])
    if @user
      @events = @user.events.all
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end
end
