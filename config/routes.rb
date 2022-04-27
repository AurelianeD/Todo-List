Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'index', to: 'todo_lists#index'

  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sessions#welcome"
end
