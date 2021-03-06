Rails.application.routes.draw do
  
  resources :closes
  resources :financials
  resources :schedules
  resources :events
  resources :batchanimals
  resources :batches
  resources :services  
  resources :diets
  resources :stocks
  resources :pasteurs
  resources :feeds
  resources :bins
  resources :analyses
  resources :shipments
  resources :treatments
  resources :employees
  resources :lots
  resources :properties
  resources :profiles
  resources :reproductions
  resources :animals
  resources :donors
  resources :notifications
  resources :productions
  resources :developments
  resources :glebes
  resources :illnesses
  resources :treatments
  resources :drugs
  resources :diseases

  get 'show_notification'   , to: 'notifications#show_notification', as: :show_notification
  get 'animal_production'   , to: 'animals#animal_production'      , as: :animal_production
  get 'animal_development'  , to: 'animals#animal_development'     , as: :animal_development
  get 'animal_reproduction' , to: 'animals#animal_reproduction'    , as: :animal_reproduction
  get 'animal_illness'      , to: 'animals#animal_illness'         , as: :animal_illness
  get 'animal_diet'         , to: 'animals#animal_diet'            , as: :animal_diet
  get 'property_glebes'     , to: 'properties#property_glebes'     , as: :property_glebes
  get 'property_employees'  , to: 'properties#property_employees'  , as: :property_employees
  get 'descartados'         , to: 'animals#descartados'            , as: :descartados
  get 'stopped'             , to: 'animals#stopped'                , as: :stopped
  get 'all_animals'         , to: 'animals#all_animals'            , as: :all_animals
  get 'new_financial_ajax'  , to: 'financials#new_financial_ajax'  , as: :new_financial_ajax
  get 'shipment_financial'  , to: 'financials#shipment_financial'  , as: :shipment_financial
  post 'financial_shipment' , to: 'financials#financial_shipment'  , as: :financial_shipment
  get 'close_financial'    , to: 'financials#close_financial'     , as: :close_financial
  post 'financial_close'    , to: 'financials#financial_close'     , as: :financial_close
  post 'search_financial'    , to: 'financials#search_financial'     , as: :search_financial
  get 'back'                , to: 'financials#back'                 , as: :back

  #PDF
  get "pdf", to: "relatorios#pdf", as: :pdf

  #XLS
  get "excel", to: "excel#excel", as: :excel
  
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "home#index"


end
