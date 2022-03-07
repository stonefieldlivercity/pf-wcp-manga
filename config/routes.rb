Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  devise_for :users

  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"

  resources :genres
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
