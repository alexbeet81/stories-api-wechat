Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # api/v1
  root to: 'pages#home'

  namespace :api do
    namespace :v1 do
      resources :stories, only: [:index, :show, :update, :create, :destroy] do
        resources :comments, only: [:create]
      end
    end
  end
end
