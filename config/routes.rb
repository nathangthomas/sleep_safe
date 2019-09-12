Rails.application.routes.draw do

  resources :events, only: [:index, :show]

  namespace :admin do
  resources :events
  end

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
  get '/webhook', to: "webhooks#index"
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
