class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ensure_authy_enabled

    private

    def ensure_authy_enabled
      return if params[:controller] == "devise/devise_authy"
      if current_user and !current_user.authy_enabled?
        redirect_to user_token
      end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country_code, :phone_number, :opt_in])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country_code, :phone_number, :opt_in])
  end
end
