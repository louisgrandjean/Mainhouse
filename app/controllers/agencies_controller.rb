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
end

def destroy
  @agency = Agency.find_by(id: current_agency)
  @agency.delete
  redirect_to root_path
end

private
def agency_params
  params.permit(:name, :city, :adress, :phone_number, :siren)
end

end
