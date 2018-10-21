Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :orders
  resources :products
  
  resources :categories do
    resources :products, include: [:index, :show, :create]
  end

  resources :merchants do
    resources :products, include: [:index, :show, :create]
  end




  # NOTE: nested route ideas: merchants/id#/products and categories/id#/products ???

end
