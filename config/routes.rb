Rails.application.routes.draw do
  
  root 'quotes#index'
  
  namespace :api  do
    namespace :v1  do
      resources :users, only: [:create]
      resources :authenticate, only: [:create]
      resources :quotes, only: [:index]

      post 'auth/create', to: 'users#create'
      post 'auth/authenticate', to: 'authenticate#create'
      get 'quotes/:search_tag', to: 'search#index'
    end
  end
end
