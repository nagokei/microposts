Rails.application.routes.draw do
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
  resources :microposts do
    post 'retweet', on: :member
  end
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:show, :create, :destroy]
  # resources :retweets, only: [:create]
end