Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes do
    resources :bookings, only: [:new, :create]
  end
  get 'my_bikes', to: 'bikes#my_bikes'
  patch 'bookings/:id/accept', to: 'bookings#accept', as: 'accept_booking'
  patch 'bookings/:id/decline', to: 'bookings#decline', as: 'decline_booking'
  resources :bookings, only: [:index]
end
