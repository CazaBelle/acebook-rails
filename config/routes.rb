# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'

  # get 'sessions/new'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/homepage', to: 'welcome#index'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  # allows posts not to be nested under user?
  resources :posts, except: :new

  resources :users do
    resources :posts, only: :new
  end
end
