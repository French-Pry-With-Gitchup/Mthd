Rails.application.routes.draw do
  resources :topics
  resources :snippets
  resources :categories
  resources :users only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
