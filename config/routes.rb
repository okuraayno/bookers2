Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about', to: 'homes#about', as: 'about'
  get '/users/:id', to: 'users#show', as: 'user'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :index, :edit, :update]
end