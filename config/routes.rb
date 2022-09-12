Rails.application.routes.draw do
  get "posts/index" , to: "posts#index"
  get "posts/new", to: "posts#new"
  get "posts/:id", to: "posts#show"
  post "posts/create", to: "posts#create", as: :cc
  get "posts/:id/edit", to: "posts#edit"
  post "posts/:id/update", to: "posts#update"
  post "posts/:id/destroy", to: "posts#destroy"

  get "/", to: "home#top"
  get "about", to: "home#about"
end

