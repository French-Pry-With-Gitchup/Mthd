Rails.application.routes.draw do
  # resources :topics     # Only needed for database Relationships
  # resources :snippets   # Not in use Yet
  # resources :categories # Not in use Yet
  resources :users, only: %i[index show new create]        # Will build up each CRUD function as we develop it over time. 
end
