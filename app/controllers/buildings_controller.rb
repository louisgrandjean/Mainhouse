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
      @building.picture = "https://www.cartefinancement.com/wp-content/uploads/2019/10/vir-1024x682.jpg"

      if @building.save
        redirect_to agency_buildings_path
      else 
        render :new
      end
    end

    def destroy 
      @building = Building.find_by(agency_id: params[:agency_id], id: params[:id])
      @building.destroy
      redirect_to agency_buildings_path
    end

    private
    def building_params
      params.permit(:agency_id, :name, :adress, :reference, :picture)
    end
end
