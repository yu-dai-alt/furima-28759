Rails.application.routes.draw do
  root 'items#index'
  devise_for :users

  resources :items, only: [:index, :new, :create, :show, :edit, :update]
end
