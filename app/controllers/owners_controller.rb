class OwnersController < ApplicationController
	before_action :authenticate_agency!, only: [:index, :owners]

    def show
			@owner = Owner.find_by(building_id: params[:building_id], id: current_owner)
			@building = Building.find_by(agency_id: params[:agency_id], id: params[:building_id])
			@agency = Agency.find_by(id: params[:agency_id])

			if @owner.nil?
				redirect_to new_owner_session_path
			end
    end
    



		def index
			@owners = Owner.all
		end

    def create
    end

		def owners
			@owners = Owner.all
			@agency = Agency.find(params[:agency_id])
			if @agency.id == current_agency.id
				render :owners
			else 
				redirect_to all_owners_path(current_agency.id)
		end
			
		end

		
end

