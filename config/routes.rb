Rails.application.routes.draw do
  get '/courses/seasons', to: 'courses#seasonsList'
  resources :votes
  resources :user_ratings
  resources :comments
  resources :favorites
  resources :students
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/courses/:season/:amount/load_more', to: 'courses#load'

  get 'courses/:season/season', to: 'courses#season'

  
end
