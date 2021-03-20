class OwnersController < ApplicationController
    def show
			@owner = Owner.find_by(building_id: params[:id], id: current_owner)
			@building = Building.find_by(agency_id: current_agency, id: params[:id])
			@agency = Agency.find_by(id: current_agency)

			if @owner.nil?
				redirect_to new_owner_session_path
			end
    end
    
		def index
		end

    def create
    end
end
