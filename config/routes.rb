Rails.application.routes.draw do
  resources :votes
  resources :user_ratings
  resources :comments
  resources :favorites
  resources :students
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
