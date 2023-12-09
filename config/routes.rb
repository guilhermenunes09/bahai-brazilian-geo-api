Rails.application.routes.draw do
  resources :cities, only: [:index]
  resources :states, only: [:index]
  resources :regions, only: [:index]
end
