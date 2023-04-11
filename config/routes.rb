Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get '/users/sign_out', to: 'sessions#destroy'

  resources :prototypes do
    resources :comments, only: [:create, :destroy, :edit, :update]
  end

  resources :users, only: [:show]
end
