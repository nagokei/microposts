Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'followings/:id', to: 'users#followings', as: 'followings'
  get 'followers/:id', to: 'users#followers', as: 'followers'
  
  resources :users
  resources :sessions
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end