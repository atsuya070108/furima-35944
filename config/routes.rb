Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: :index
  resources :users, only: [:edit, :update, :destroy] do
  end
end
