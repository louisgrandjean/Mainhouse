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
      redirect_to agency_building_path(params[:agency_id], params[:building_id])
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
		redirect_to agency_building_path
		else
		render :edit
		end
	end


  private
  def event_params
    params.permit(:building_id, :datetime, :duration, :title, :description)
  end
end
