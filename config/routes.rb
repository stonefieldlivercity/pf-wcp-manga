Rails.application.routes.draw do
  get 'genres/index'
  devise_for :users, controllers: {
    sessions: "users/session",
    registrations: "users/registrations"
  }

  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  get "/users/mypage" => "users#show", as: "mypage"
  resources :users
  resources :genres
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
