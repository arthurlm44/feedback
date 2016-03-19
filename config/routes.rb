Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"

  resources :reviews, only: [:index, :new, :create]
  resources :ratings, only: [ :index, :new, :create]
  resources :statements, only: [:index, :new, :create]
end