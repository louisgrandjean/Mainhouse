class BuildingsController < ApplicationController
    before_action :authenticate_agency!

    def index 
        @buildings = Building.all
    end 

    def show
        @building = Building.find_by(agency_id: current_agency, id: params[:id])
        if @building.nil?
            redirect_to agency_buildings_path
        end

    end

    def new
      @building = Building.new
    end

    def create
      @building = Building.new(building_params)
      @building.picture = "https://www.cartefinancement.com/wp-content/uploads/2019/10/vir-1024x682.jpg"

      if @building.save
        redirect_to agency_buildings_path
      else 
        render :new
      end
    end


    def edit
      @building = Building.find_by(agency_id: current_agency, id: params[:id])
      if @building.nil?
        redirect_to agency_buildings_path
    end
    end

    def update
      @building = Building.find_by(agency_id: current_agency, id: params[:id])
      if @building.update(building_params)
      redirect_to agency_building_path
      else
      render :edit
      end
    end


    def destroy 
      @building = Building.find_by(agency_id: current_agency, id: params[:id])
      @owner = Owner.find_by(building: @building.id)
      while @owner != nil
        @owner.delete
        @owner = Owner.find_by(building: @building.id)
      end
      @event = Event.find_by(building_id: @building.id)
      while @event != nil
        @event.delete
        @event = Event.find_by(building_id: @building.id)
      end
      @building.delete
      redirect_to agency_buildings_path(params[:agency_id])
    end

    private
    def building_params
      params.permit(:agency_id, :name, :adress, :reference, :picture)
    end
end
