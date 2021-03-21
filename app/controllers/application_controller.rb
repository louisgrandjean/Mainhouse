class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    case resource
    when Agency
      agency_buildings_path(current_agency)
    when Owner
      agency_building_owner_path(current_owner.building.agency_id, current_owner.building.id, current_owner.id)
    end
  end

end
