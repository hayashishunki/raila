Rails.application.routes.draw do
  get "posts/index" , to: "posts#index"
  get "posts/new", to: "posts#new"
  get "posts/:id", to: "posts#show"
  post "posts/create", to: "posts#create"
  get "/", to: "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "about", to: "home#about"
end

