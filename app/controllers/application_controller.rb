class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    # For sign-up
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password avatar])

    # For editing existing account
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email password avatar])
  end
end
