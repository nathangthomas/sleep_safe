# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    @user = User.new(user_params)
    if @user.save
      # Save the user_id to the session object
      session[:user_id] = @user.id

      # Create user on Authy, will return an id on the object
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone_number,
        country_code: @user.country_code
      )
      @user.update(authy_id: authy.id)
      # Send an SMS to your user
      Authy::API.request_sms(id: @user.authy_id)
      redirect_to verify_path
    else
      render :new
    end
  end

  def show_verify
    return redirect_to new_user_path unless session[:user_id]
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :phone_number, :email, :password, :password_confirmation
    )
  end
end
