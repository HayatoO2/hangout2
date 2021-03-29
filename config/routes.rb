Rails.application.routes.draw do
  root to: 'shares#index'
  devise_for :users
  resources :users, only: [:edit, :update, :show]
end
