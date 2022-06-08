Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'dashboard', to: 'pages#dashboard'
  get 'messages', to: 'pages#messages'

  resources :flats do
    resources :reviews, only: :create
  end

  resources :chatrooms, only: [:show, :create] do
    resources :messages, only: :create
  end
end
