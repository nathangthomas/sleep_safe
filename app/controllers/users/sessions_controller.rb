# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_signed_out_user

  # GET /resource/sign_in
  def new
  end

  # POST /resource/sign_in
  def create
    user = User.find_by_email(params[:email])
   if user && user.valid_password?(params[:password])
     session[:user_id] = user.id
     redirect_to root_url, notice: "Logged in!"
   else
     flash.now[:alert] = "Email or password is invalid"
     render "new"
   end
  end

  # DELETE /resource/sign_out
  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "You are now Logged out."
  end
end
