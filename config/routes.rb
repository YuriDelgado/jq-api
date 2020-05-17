Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :profiles
  resources :orders do
    resources :items
  end
  resources :products
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'authenticate', to: 'authentication#authenticate'
end
