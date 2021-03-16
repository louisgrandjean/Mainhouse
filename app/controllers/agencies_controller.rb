class AgenciesController < ApplicationController

def index 
  @building = Building.find_by(agence_id: (params[:id]))
end 

def create
end

end
