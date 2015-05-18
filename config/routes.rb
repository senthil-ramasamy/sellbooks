Rails.application.routes.draw do
  resources :refers
  get 'home/index'

  root to: 'home#index'
  devise_for :users
  resources :users
end
