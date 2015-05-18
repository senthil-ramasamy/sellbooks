Rails.application.routes.draw do
  resources :sells
  resources :refers
  get 'home/index'

  root to: 'sells#new'
  devise_for :users
  resources :users

  get '/:id',to: 'sells#new'
end
