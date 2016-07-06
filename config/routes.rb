Rails.application.routes.draw do

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

end
