Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :users, only: [:create]
      resources :posts
      resources :comments
      post 'authentication', to: 'authentication#create'
      get 'current_user', to: 'current_user#index'
    end
  end
end
