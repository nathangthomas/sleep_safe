Rails.application.routes.draw do

  root "home#index"
  get '/dashboard', to: 'users#show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
