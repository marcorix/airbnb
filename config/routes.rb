Rails.application.routes.draw do
  devise_for :users
  resources :flats do
    resources :bookings, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :destroy] do
    resources :messages, only: [:create]
  end

  get 'users/:id', to: 'users#show', as: :user
  get 'landing', to: 'pages#landing'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "flats#index"
end
