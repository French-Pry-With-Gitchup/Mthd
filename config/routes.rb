Rails.application.routes.draw do
  # resources :topics     # Only needed for database Relationships
  # resources :snippets   # Not in use Yet
  # resources :categories # Not in use Yet
  resources :users        # Will build up each CRUD function as we develop it over time. 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
