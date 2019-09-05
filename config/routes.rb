Rails.application.routes.draw do

  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

  resources :items, only: [:show] do
    resources :pictures, only: [:create]
  end
  resources :users, only:[:index, :show, :edit, :update]

  resources :carts

  resources :orders, only:[:create, :show]






end
