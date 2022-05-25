Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes do
    resources :bookings, only: [:new, :create]
  end
  get 'my_bikes', to: 'bikes#my_bikes'
  resources :bookings, only: [:index]
end
