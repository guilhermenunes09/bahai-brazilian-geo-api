Rails.application.routes.draw do
  resources :cities, only: [:index, :show]
  resources :bahai_clusters, only: [:index, :show, :update]
  resources :bahai_zones, only: [:index, :show]
  resources :states, only: [:index, :show]
  resources :bahai_regions, only: [:index, :show]
  resources :regions, only: [:index, :show]
  resources :countries, only: [:index, :show]

  resources :projects, only: [:index, :show, :create, :update] do
    member do
      get :map_bundle
      patch :config, action: :update_config
      post :duplicate
    end
    resources :project_legends, only: [:index, :create]
  end

  resources :project_legends, only: [:update, :destroy]
end
