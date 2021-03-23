class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    case resource
    when Agency
      if current_agency.subscribed == true
      agency_buildings_path(current_agency)
      else 
        new_subscription_path
      end
    when Owner
      agency_building_owner_path(current_owner.building.agency_id, current_owner.building.id, current_owner.id)
    end
  end

end
