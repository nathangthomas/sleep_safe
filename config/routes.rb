Rails.application.routes.draw do

  resources :shelters, only: [:index, :show]
  root "home#index"

  get '/search', to: "search#index"

  get '/dashboard', to: 'users#show', as: 'dashboard'
  # devise_for :users
  devise_for :users, :controllers => { :registrations => "users/registrations" }


  get "users/verify", to: 'users#show_verify', as: 'verify'
  post "users/verify"
  post "users/resend"

  # constraints subdomain: "webhooks" do
  post'/incoming', to: "webhooks#receive"
  end


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
