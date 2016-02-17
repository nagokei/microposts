Rails.application.routes.draw do
  #get 'favorites/create'

  #get 'favorites/destroy'

  root to: 'static_pages#home'
  get 'signup',    to: 'users#new'
  get 'login',     to: 'sessions#new'
  post 'login',    to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'followings/:id', to: 'users#followings', as: 'followings'
  get 'followers/:id', to: 'users#followers', as: 'followers'
  get 'favorites', to: 'favorites#show', as: 'favorites'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:show, :create, :destroy]
end