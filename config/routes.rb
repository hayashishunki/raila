Rails.application.routes.draw do
  # devise_for :users
  # get 'statics/index'
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/sign_in', to: 'users/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
