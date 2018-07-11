Rails.application.routes.draw do
  get '/login', to: 'sessions#new', as: 'new_login'
  resources :user_recipes
  get '/recipe/search', to: 'recipes#search', as: 'recipe_search'
  post '/recipe/find', to: 'recipes#find', as: 'recipe_find'
  resources :recipes
  resources :categories
  resources :user_exercises
  resources :exercises
  get '/users/choice', to: 'users#choice', as: 'user_choice'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
