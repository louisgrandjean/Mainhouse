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

    def create
    end
end
