Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "prototypes#index"
  resources :users, only: [:create, :show]
  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
  end
end
