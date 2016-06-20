Rails.application.routes.draw do

  resources :reproductions
  resources :animals
  resources :animals
  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  root to: "home#index"

  resources :lots
  resources :properties
  resources :profiles

end
