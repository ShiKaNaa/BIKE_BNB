Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :bikes, only: [ :index, :my_bikes, :show, :new, :create, :destroy ]
end
