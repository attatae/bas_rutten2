class EventsController < ApplicationController

	http_basic_authenticate_with name: "cjdealba", password: "secret",
except: [:index, :show]

	def index
		@events = Event.all 
	end
	
	def new # diff between new and create?
		@event = Event.new
	end

	def create #save our new event to a database
		@event = Event.new(params[:event].permit(:title, :text))

		if @event.save
			redirect_to @event 
		else
			render 'new'
			#The render method is used so that the @post 
			#object is passed back to the new template when it is rendered. 
			#This rendering is done within the same request as the form 
			#submission, whereas the redirect_to will tell the browser to issue another request.
		end
	end

	def show #show, being an action
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])

		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event = Event.find(params[:id])

		@event.destroy

		redirect_to events_path
	end

	private
		def event_params
			params.require(:event).permit(:title, :text)
		end
end

