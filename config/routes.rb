# frozen_string_literal: true

Rails.application.routes.draw do
  post "users/:id/update", to: "users#update"
  get "users/:id/edit", to: "users#edit"
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

  root 'home#top'
  get 'about', to: 'home#about'
end
