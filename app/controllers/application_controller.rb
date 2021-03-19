class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    case resource
    when Agency
      agency_buildings_path(current_agency)
    when Owner
      root_path
    end
  end

end
