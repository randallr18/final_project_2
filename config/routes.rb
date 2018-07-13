Rails.application.routes.draw do
  get '/users/sleepmonth', to: 'users#display_sleep', as: 'user_display_sleep'
  post '/users/sleepmonth', to: 'users#month_sleep', as: 'user_month_sleep'
  get '/users/exercise', to: 'users#display_exercise', as: 'user_display_exercise'
  post '/users/exercise', to: 'users#month_exercise', as: 'user_month_exercise'
  get '/users/choice', to: 'users#choice', as: 'user_choice'
  get '/users/month', to: 'users#display', as: 'user_display_nutrition'
  post '/users/month', to: 'users#month', as: 'user_month_nutrition'
  resources :sleeps
  resources :sessions, only: %i[new create]
  resources :user_recipes
  resources :recipes
  resources :user_exercises
  resources :exercises
  resources :users
end
