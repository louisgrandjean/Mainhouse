class OwnersController < ApplicationController
	before_action :authenticate_agency!, only: [:owners]

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

		def new 
			@owner = Owner.new
		end 

    def create
			@owner = Owner.new(owners_params)
			@owner.password = "bienvenue"

      if @owner.save
        redirect_to agency_building_owners_path(current_agency.id, params[:building_id])
      else 
        render :new
      end

      
    end

		def edit
      @owner = Owner.find_by(building_id: params[:building_id], id: params[:id])
      if @owner.nil?
        redirect_to agency_building_owners_path(params[:agency_id], params[:building_id])
      end
    end

    def update
      @owner = Owner.find_by(building_id: params[:building_id], id: params[:id])
      if @owner.update(owners_params)
				redirect_to agency_building_owner_path(params[:agency_id], params[:building_id], params[:id])
      else
      render :edit
      end
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

		def destroy 
      @owner = Owner.find_by(building_id: params[:building_id], id: params[:id])
      @owner.delete
      redirect_to agency_building_owners_path(params[:agency_id], params[:building_id])
    end

		private
    def owners_params
      params.permit(:building_id, :first_name, :last_name, :phone_number, :email, :password)
    end

		
end

