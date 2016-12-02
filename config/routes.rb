Rails.application.routes.draw do
  root 'contacts#index'

  resources :users, only: [:new, :create]
  resources :contacts, only: [:index, :new, :create]

  get '/home', to: 'home#index', as: 'home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :contacts, only: [:index, :create]
      resources :months, only: [:index]
    end
  end
end
