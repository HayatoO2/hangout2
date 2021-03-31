Rails.application.routes.draw do
  root to: 'shares#index'
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  resources :shares, only: [:index, :new, :create, :show] do
    collection do
      get 'add'
      get 'add-update'
    end
    resources :presents, only: [:new, :create, :update]
  end
end
