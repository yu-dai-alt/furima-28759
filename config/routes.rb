Rails.application.routes.draw do
  root 'items#index'
  resources :cards, only: [:new, :create]
  devise_for :users
  resources :users, only:[:show, :update]
  resources :items do
    resources :orders, only:[:index, :new, :create]
  end
  resources :items, only: :order do
    post 'order', on: :member
  end
end
