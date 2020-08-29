Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  get 'items/index'
  post 'items/create'
end
