Rails.application.routes.draw do

  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  resources :items, only: [:show] do
    resources :pictures, only: [:create]
  end
  resources :users, only: [:index]

  resources :carts

  resources :orders






end
