Rails.application.routes.draw do
  # resources :topics     # Only needed for database -+
  resources :snippets, only: [:index, :show, :new, :create]
  # resources :categories # Not in use Yet

  resources :users #, only: %i[index show create edit update delete]        # Will build up each CRUD function as we develop it over time. 
  get 'user/sign_up', to: 'users#new', as: :sign_up                       # Custom URL Route to look nice
  # match 'sign_up', to: 'users#new', :via => [:get]                      # Alternative to the above

  # Handle User Login Features
  get 'user/login', to: 'users#login_form', as: :login        # Handles Page Data and User Input
  post 'user/login', to: 'users#handle_login'                 # Configures data taken from User
  post 'user/logout', to: 'users#logout'

  # Handle Edit and Delete Functions
  patch 'user/:id', to: 'users#edit'
end
