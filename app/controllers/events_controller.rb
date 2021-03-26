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
			flash[:notice] = "L'événement a bien été créé."
    else 
      render :new
			flash[:notice] = "L'événement n'a pas été créé."
		end
  end

	def edit
		@event = Event.find_by(building_id: params[:building_id], id: params[:id])
	end

	def update
		@event = Event.find_by(building_id: params[:building_id], id: params[:id])
		if @event.update(event_params)
			redirect_to agency_building_events_path(params[:agency_id], params[:building_id], params[:id])
			flash[:notice] = "L'événement a bien été mis à jour."
		else
		render :edit
		flash[:notice] = "L'événement n'a pas été mis à jour."
		end
	end

	def destroy 
		@event = Event.find_by(building_id: params[:building_id], id: params[:id])
		@event.delete
		redirect_to agency_building_events_path(params[:agency_id], params[:building_id], params[:id])
		flash[:notice] = "L'événement a bien été supprimé."
	end

	def events
		@events = Event.all
		@agency = Agency.find(params[:agency_id])
		if @agency.id == current_agency.id
			render :events
		else 
			redirect_to all_events_path(current_agency.id)
			flash[:notice] = "Cet événement n'existe pas."
		end
	end


  private
  def event_params
    params.permit(:building_id, :datetime, :duration, :title, :description)
  end
end
