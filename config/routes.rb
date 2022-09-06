Rails.application.routes.draw do
  post "users/create", to: "users#create"
  get "signup", to: "users#new"
  get 'users/index'
  get "users/:id", to: "users#show"

  get "posts/index" , to: "posts#index"
  get "posts/new", to: "posts#new"
  get "posts/:id", to: "posts#show"
  post "posts/create", to: "posts#create"
  get "posts/:id/edit", to: "posts#edit"
  post "posts/:id/update", to: "posts#update"
  post "posts/:id/destroy", to: "posts#destroy"

  get "/", to: "home#top"
  get "about", to: "home#about"
end

