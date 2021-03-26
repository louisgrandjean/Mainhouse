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
      if @building.save
        redirect_to agency_buildings_path
        flash[:notice] = "Le bâtiment a bien été créé."
      else 
        render :new
        flash[:notice] = "Le bâtiment n'a pas été créé."
      end
    end


    def edit
      @building = Building.find_by(agency_id: current_agency, id: params[:id])
      if @building.nil?
        redirect_to agency_buildings_path
        flash[:notice] = "Ce bâtiment n'existe pas."
    end
    end

    def update
      @building = Building.find_by(agency_id: current_agency, id: params[:id])
      if @building.update(building_params)
      redirect_to agency_building_path
      flash[:notice] = "Le bâtiment a été mis à jour."
      else
      render :edit
      flash[:notice] = "Le bâtiment n'a pas été mis à jour."

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
      flash[:notice] = "Le bâtiment et ses propriétaires ont bien été supprimés."
    end

    private
    def building_params
      params.permit(:agency_id, :name, :adress, :reference, :picture, :avatar)
    end
end
