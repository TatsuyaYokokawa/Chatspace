Rails.application.routes.draw do
  devise_for :accounts

  root "groups#index"
  resources :accounts, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update]
end
