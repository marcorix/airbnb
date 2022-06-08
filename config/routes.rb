Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :flats do
    resources :reviews, only: :create
  end

  resources :chatrooms, only: :show
end
