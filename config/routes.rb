Rails.application.routes.draw do

  resources :glebes
  resources :glebes
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"
  resources :lots
  resources :properties
  resources :profiles
  resources :reproductions
  resources :animals
  resources :notifications
  resources :productions
  resources :developments

  get 'show_notification' , to: 'notifications#show_notification', as: :show_notification
  get 'animal_production' , to: 'animals#animal_production', as: :animal_production
  get 'animal_development' , to: 'animals#animal_development', as: :animal_development
  get 'animal_reproduction' , to: 'animals#animal_reproduction', as: :animal_reproduction

end
