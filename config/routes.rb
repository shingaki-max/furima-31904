Rails.application.routes.draw do
  get 'purchase/index'
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items do
    resources :purchases
  end
end
