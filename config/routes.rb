Rails.application.routes.draw do
  
  resources :products
  resources :categories
  devise_for :users

  resource :cart, only: [:show]
  resources :cart_items, only: [:create, :destroy]
  resources :orders, only: [:new, :create, :index, :show]

  
  root "products#index"
end
