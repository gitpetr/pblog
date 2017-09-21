class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :danger, :info, :warning
  # helper_method :money

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
      if resource.is_a?(Admin)
        admin_dashboard_path
      elsif resource.is_a?(User)
        dashboard_path
      else
        root_path
      end
  end
end
