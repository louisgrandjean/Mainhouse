class AgenciesController < ApplicationController

def show 
  @agency = Agency.find(params[:id])
end 

def create
end

def edit
  @agency = Agency.find(params[:id])
end


def update
  @agency = Agency.find(params[:id])
  @agency.update(agency_params)
  redirect_to agency_path(params[:id])
end

def destroy
  @agency = Agency.find_by(id: params[:id])
  @agency.destroy
  redirect_to root_path
end

private
def agency_params
  params.permit(:name, :city, :adress, :phone_number, :siren)
end

end
