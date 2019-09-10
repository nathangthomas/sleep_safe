Rails.application.routes.draw do

  resources :shelters, only: [:index, :show]
  root "home#index"

  get '/search', to: "search#index"

  get '/dashboard', to: 'users#show', as: 'dashboard'

  devise_for :users
  get '/verify', to: "users#verify", as: 'verify'
end
