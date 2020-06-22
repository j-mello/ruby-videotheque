Rails.application.routes.draw do
  root 'home#index'
  get 'home/private'
  devise_for :users
  resources :genres
  resources :films
  resources :trocs
  resources :admin
end
