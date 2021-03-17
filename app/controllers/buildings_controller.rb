class BuildingsController < ApplicationController

    def index 
        @buildings = Building.all
    end 

    def show
        @building = Building.find_by(agency_id: params[:agency_id], id: params[:id])
        if @building.nil?
            redirect_to root_path
        end

    end

    def new
      @building = Building.new
    end

    def create
      @building = Building.new(building_params)

      if @building.save
        redirect_to agency_buildings_path
      else 
        render :new
      end
    end

    private
    def building_params
      params.permit(:agency_id, :name, :adress, :reference)
    end
end
