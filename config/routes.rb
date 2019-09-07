Rails.application.routes.draw do

  resources :shelters
  root "home#index"
  
  get '/dashboard', to: 'users#show', as: 'dashboard'

  devise_for :users, :path_names => {
	:verify_authy => "/verify-token",
	:enable_authy => "/enable-two-factor",
	:verify_authy_installation => "/verify-installation",
	:authy_onetouch_status => "/onetouch-status"}
end
