Rails.application.routes.draw do
  # login
  get "login", to: "users#login_form"
  # users
  post "users/:id/update", to: "users#update"
  get "users/:id/edit", to: "users#edit"
  post "users/create", to: "users#create"
  get "signup", to: "users#new"
  get 'users/index'
  get "users/:id", to: "users#show"
  # posts
  get "posts/index" , to: "posts#index"
  get "posts/new", to: "posts#new"
  get "posts/:id", to: "posts#show"
  post "posts/create", to: "posts#create"
  get "posts/:id/edit", to: "posts#edit"
  post "posts/:id/update", to: "posts#update"
  post "posts/:id/destroy", to: "posts#destroy"
  # home
  get "/", to: "home#top"
  get "about", to: "home#about"
end

