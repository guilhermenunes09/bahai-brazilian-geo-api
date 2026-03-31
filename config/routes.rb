Rails.application.routes.draw do
  resources :cities, only: [:index]
  resources :bahai_clusters, only: [:index, :update]
  resources :bahai_zones, only: [:index]
  resources :states, only: [:index]
  resources :regions, only: [:index]
  resources :countries, only: [:index]

  resources :projects, only: [:index, :show, :create, :update] do
    member do
      get :map_bundle
      patch :config, action: :update_config
    end
  end
end
