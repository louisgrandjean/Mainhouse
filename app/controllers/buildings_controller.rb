class BuildingsController < ApplicationController

    def index 
        @buildings = Building.all
        @building = Building.find_by(agency_id: params[:agency_id])
    end 

    def create
    end
end
