Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :boyfriends, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create]
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only:[] do
      member do
      post 'accept'
    end
    member do
      post 'reject'
    end
  end
  namespace :account do
    resources :bookings, only: [:show] do
      collection do
        get 'pending'
      end
    end
  end
end
