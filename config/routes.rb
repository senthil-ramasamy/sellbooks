Rails.application.routes.draw do
  resources :sells
  resources :refers
  get 'home/index'

  root to: 'home#index'
  devise_for :users
  resources :users
end
