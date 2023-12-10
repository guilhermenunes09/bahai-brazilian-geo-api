Rails.application.routes.draw do
  resources :cities, only: [:index]
  resources :clusters, only: [:index]
  resources :zones, only: [:index]
  resources :states, only: [:index]
  resources :regions, only: [:index]
  resources :countries, only: [:index]
end
