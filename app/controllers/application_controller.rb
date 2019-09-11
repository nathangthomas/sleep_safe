class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  helper_method :c_user

  def c_user
    @c_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country_code, :phone_number, :opt_in])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country_code, :phone_number, :opt_in])
  end
end
