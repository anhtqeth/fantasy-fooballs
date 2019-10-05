Rails.application.routes.draw do
  
  resources :users
  resources :teams
  resources :games
  resources :matches
end
