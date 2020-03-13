Rails.application.routes.draw do
  devise_for :accounts

  root "groups#index"
  resources :accounts, only: [:index,:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messagexxes, only: [:index, :create]
  end
end
