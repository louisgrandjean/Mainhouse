class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def create 

    @event = Event.new(event_params) 
    if @event.save
      redirect_to agency_building_events_path(params[:agency_id], params[:building_id], params[:id])
    else 
      render :new
		end
  end

	def edit
		@event = Event.find_by(building_id: params[:building_id], id: params[:id])
	end

	def update
		@event = Event.find_by(building_id: params[:building_id], id: params[:id])
		if @event.update(event_params)
			redirect_to agency_building_events_path(params[:agency_id], params[:building_id], params[:id])
		else
		render :edit
		end
	end

	def destroy 
		@event = Event.find_by(building_id: params[:building_id], id: params[:id])
		@event.delete
		redirect_to agency_building_events_path(params[:agency_id], params[:building_id], params[:id])
	end

	def events
		@events = Event.all
		@agency = Agency.find(params[:agency_id])
		if @agency.id == current_agency.id
			render :events
		else 
			redirect_to all_events_path(current_agency.id)
		end
	end


  private
  def event_params
    params.permit(:building_id, :datetime, :duration, :title, :description)
  end
end
