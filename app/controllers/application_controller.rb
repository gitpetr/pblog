class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :danger, :info, :warning, :error
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

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :password, :password_confirmation])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
    end
end
