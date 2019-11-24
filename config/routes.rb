Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#search'
  resources :boyfriends, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create]
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show]
  namespace :account do
    resources :boyfriends, only: [:index]
  end
end
