Rails.application.routes.draw do
  # resources :topics     # Only needed for database Relationships
  resources :snippets, only: [:index]
  # resources :categories # Not in use Yet
  resources :users, only: [:index, :show, :new, :create]        # Will build up each CRUD function as we develop it over time.
end
