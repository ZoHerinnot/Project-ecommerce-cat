Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :items, only: [:show] do
    resources :pictures, only: [:create]
  end
  resources :users, only: [:index]

  resources :carts






end
