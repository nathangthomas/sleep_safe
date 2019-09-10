Rails.application.routes.draw do

  resources :shelters
  root "home#index"
  get '/dashboard', to: 'users#show', as: 'dashboard'
  # devise_for :users
  devise_for :users, :controllers => { :registrations => "users/registrations" }


  get "users/verify", to: 'users#show_verify', as: 'verify'
  post "users/verify"
  post "users/resend"

 # Create users
  # resources :users, only: [:new, :create, :show]

 # Home page
 #  root 'main#index'

  # namespace :api do
  #   namespace :v1, defaults: { format: :json} do
  #     resources :users, only: [:create]
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
