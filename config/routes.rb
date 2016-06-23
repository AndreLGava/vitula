Rails.application.routes.draw do
  get 'user/index'

  get 'user/new'

  get 'user/create'

  get 'user/show'

  get 'user/edit'

  get 'user/update'

  get 'user/delete'

  get 'user/destroy'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"
  resources :lots
  resources :properties
  resources :profiles
  resources :reproductions
  resources :animals
end
