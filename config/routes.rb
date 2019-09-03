Rails.application.routes.draw do

  root "home#index"
  get '/dashboard', to: 'users#show', as: 'dashboard'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
