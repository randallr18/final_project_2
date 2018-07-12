Rails.application.routes.draw do
  resources :sleeps
  resources :sessions, only: %i[new create]
  resources :user_recipes
  get '/recipe/search', to: 'recipes#search', as: 'recipe_search'
  post '/recipe/find', to: 'recipes#find', as: 'recipe_find'
  resources :recipes
  resources :categories
  resources :user_exercises
  resources :exercises
  get '/users/choice', to: 'users#choice', as: 'user_choice'
  get '/users/month', to: 'users#display', as: 'user_display_nutrition'
  post '/users/month', to: 'users#month', as: 'user_month_nutrition'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
