Rails.application.routes.draw do
  # Routes for Google authentication
  get 'auth/:provider/callback’, to: 'sessions#googleAuth'
  get 'auth/failure’, to: redirect('/’)
  get '/courses/seasons', to: 'courses#seasonsList'
  resources :votes
  resources :user_ratings
  resources :comments
  resources :favorites
  resources :students
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/courses/:season/:amount/load_more', to: 'courses#load'

  get '/courses/:season/new_season_home', to: 'courses#new_season_home'

  patch '/comments/:id/changeVotes', to: 'comments#changeVotes'
end
