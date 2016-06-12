Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  root to: "home#index"

  resources :profiles
  resources :modulos
  resources :permissions
  resources :functionalities

end
