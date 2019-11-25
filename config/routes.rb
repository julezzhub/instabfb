Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boyfriends, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create]
    resources :bookings, only: [:create]
  end
  namespace :account do
    resources :boyfriends, only: [:index]
    resources :bookings, only: [:show]
  end
end
