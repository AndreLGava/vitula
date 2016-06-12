Rails.application.routes.draw do

  resources :functionalities
  resources :permissions
  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  root to: "home#index"

  resources :profiles
  resources :modulos
  resources :funcionalities

end
