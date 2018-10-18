Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :categories
  resources :merchants
  resources :orders
  resources :products
  resources :sessions
  resources :welcome
  
end
