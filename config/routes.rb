Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :flats do
    resources :reviews, only: :create
  end
end
