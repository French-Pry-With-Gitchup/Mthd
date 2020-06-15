Rails.application.routes.draw do
  # resources :topics     # Only needed for database Relationships
  resources :snippets, only: [:index, :show, :new, :create]
  # resources :categories # Not in use Yet

  resources :users, only: %i[index show create]  # Will build up each CRUD function as we develop it over time. 
  get 'user/sign_up', to: 'users#new', as: :sign_up    # Custom URL Route to look nice
  # match 'sign_up', to: 'users#new', :via => [:get]   # Alternative to the above

  # Handle User Login Features
  get 'user/login', to: 'users#login_form', as: :login       # Handles Page Data and User Input
  post 'users/login', to: 'users#handle_login'
end
