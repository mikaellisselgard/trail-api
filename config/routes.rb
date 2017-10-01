# frozen_string_literal: true

Rails.application.routes.draw do
  post 'v1/authenticate_user', to: 'authentication#authenticate_user'

  get    'v1/locations',         to: 'locations#index'
  get    'v1/locations/:id',     to: 'locations#show'
  get    'v1/locations_closest', to: 'locations#closest'
  get    'v1/locations_within',  to: 'locations#within'
  post   'v1/locations',         to: 'locations#create'
  patch  'v1/locations/:id',     to: 'locations#update'
  delete 'v1/locations',         to: 'locations#destroy'

  get    'v1/users/:id', to: 'users#show'
  post   'v1/users',     to: 'users#create'
  patch  'v1/users/:id', to: 'users#update'
  delete 'v1/users',     to: 'users#destroy'
end
