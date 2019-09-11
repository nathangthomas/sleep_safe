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

end
