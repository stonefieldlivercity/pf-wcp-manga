Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  get "/homes/language/:lang" => "homes#language"
  get "/users/mypage/:id" => "users#show", as: "mypage"
  resources :users, only: [:show, :edit, :update]
  resources :genres, only: [:index, :show, :new, :create, :destroy]
  get 'search' => 'books#search'
  get 'result' => 'books#result'
  resources :books, only: [:new, :create, :show, :index, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
  resource :ratings, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
