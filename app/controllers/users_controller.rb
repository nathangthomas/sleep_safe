class UsersController < ApplicationController
  before_save :valid_two_factor_confirmation
  
  def show
    @user = current_user
  end

  def new
     @user = User.new
   end

   def create
     @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id

       authy = Authy::API.register_user(
         email: @user.email,
         cellphone: @user.phone_number,
         phone_number: @user.country_code
       )
       @user.update(authy_id: authy.id)

       redirect_to account_path
     else
       render :new
     end
   end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :country_code, :phone_number, :email, :encrypted_password)
  end
end
