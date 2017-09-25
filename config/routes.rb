# frozen_string_literal: true

Rails.application.routes.draw do
  post 'v1/authenticate_user', to: 'authentication#authenticate_user'

  get    'v1/locations',     to: 'locations#index'
  post   'v1/locations',     to: 'locations#create'
  delete 'v1/locations',     to: 'locations#destroy'
  get    'v1/locations/:id', to: 'locations#show'
  patch  'v1/locations/:id', to: 'loctions#update'

  resources :fishes # TODO: Fix when item base model is implemented

  post   'v1/users',     to: 'users#create'
  delete 'v1/users',     to: 'users#destroy'
  get    'v1/users/:id', to: 'users#show'
  patch  'v1/users/:id', to: 'users#update'
end
