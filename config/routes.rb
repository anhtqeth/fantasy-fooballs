Rails.application.routes.draw do
  root 'static_pages#home', as: 'home'
  resources :users
  resources :teams
  resources :games
  resources :matches
end
