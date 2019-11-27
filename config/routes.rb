Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boyfriends, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create]
    resources :bookings, only: [:new, :create]
  end
  namespace :account do
    resources :bookings, only: [:index]
  end
end
