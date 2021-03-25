class AgenciesController < ApplicationController

def show 
  @agency = Agency.find_by(id: current_agency)
end 

def create
end

def edit
  @agency = Agency.find_by(id: current_agency)
end


def update
  @agency = Agency.find_by(id: current_agency)
  @agency.update(agency_params)
  redirect_to agency_path(params[:id])
  flash[:success] = "La mise a jour a bien eu lieu"
end

def destroy
  @agency = Agency.find_by(id: params[:id])
  Building.all.each do |build|
    if build.agency.id == current_agency.id
      @owner = Owner.find_by(building: build.id)
      while @owner != nil
        @owner.delete
        @owner = Owner.find_by(building: build.id)
      end
      @event = Event.find_by(building_id: build.id)
      while @event != nil
        @event.delete
        @event = Event.find_by(building_id: build.id)
      end
    build.delete
    end
  end
  @agency.delete
  redirect_to root_path
  flash[:success] = "La suppression a jour a bien eu lieu"
end

private
def agency_params
  params.permit(:name, :city, :adress, :phone_number, :siren)
end

end
