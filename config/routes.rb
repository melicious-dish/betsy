Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/product/:id/add_to_order', to: 'products#add_to_order', as: 'add_to_order'

  get "/auth/:provider/callback", to: "sessions#create"

  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :orders


  resources :categories do
    resources :products, include: [:index, :show, :create]
  end

  resources :merchants do
    resources :products, include: [:index, :show, :create]
  end

  resources :products, only: [:index, :new, :create, :edit, :show]



  # NOTE: nested route ideas: merchants/id#/products and categories/id#/products ???

end
