Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to:"sessions#destroy"
  
  resources :users, except: [:index, :show, :update]
  resources :prefectures, only: [:show]
  resources :travels, only: [:new, :show, :create]
  resources :comments, only: [:new, :create, :destroy]
end
