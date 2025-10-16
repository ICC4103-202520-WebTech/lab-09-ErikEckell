Rails.application.routes.draw do
  get "users/index"
  get "users/edit"
  get "users/update"
  get "users/destroy"
  devise_for :users
  root "recipes#index"

  resources :recipes

  # Admin user management
  resources :users, only: [:index, :edit, :update, :destroy] # Opciones mínimas para administrar
end
