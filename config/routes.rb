Rails.application.routes.draw do
  resources :orders
  resources :stock_transactions
  root to: 'products#index'

  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
