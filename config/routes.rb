Rails.application.routes.draw do
  devise_for :accounts

  root "messages#index"
  resources :accounts, only: [:edit, :update]
  resources :groups, only: [:new, :create]
end
