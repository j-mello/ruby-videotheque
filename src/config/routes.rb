Rails.application.routes.draw do
  root 'home#index'
  get 'home/private'
  devise_for :users
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :films
  resources :trocs
end
