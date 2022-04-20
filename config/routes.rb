Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  resources :personal_infos
  get "editinfo", to: "personal_infos#show"
  patch "personal_infos#edit", to: "personal_infos#update"
  resources :games do
    resources :notes, only: [:create, :destroy]
  end

  root to: 'users#show'
  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"
  get "edit_info", to: "personal_infos#edit"

  resources :users
  resources :genres
  get 'user/show' => 'users#show', as:'show'
  # get 'genres/:id' => 'genres#show', as: 'find_friends'
  get 'genres/index'
  get 'genres/show'

  get "edit_genre", to: "users#edit"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: 'json'} do
    get 'games/search', to: 'games#search'
    get 'personal_infos/search', to: 'personal_infos#search'
    get 'genres/search', to: 'genres#search'
    get 'users/search', to: 'users#search'
    get 'notes/search', to: 'notes#search'
    post "/login", to: "sessions#login"
    post "/signup", to: "sessions#signup"

    resources :todos
    resources :games
    resources :notes
    resources :genres
    resources :personal_infos
    resources :users
  end
end
