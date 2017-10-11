# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :v1, path: '/api/v1' do
    post 'authenticate_user', to: 'authentication#authenticate_user'

    get    'locations',         to: 'locations#index'
    get    'locations/:id',     to: 'locations#show'
    get    'locations_closest', to: 'locations#closest'
    get    'locations_within',  to: 'locations#within'
    post   'locations',         to: 'locations#create'
    patch  'locations/:id',     to: 'locations#update'
    delete 'locations',         to: 'locations#destroy'

    get    'users/:id', to: 'users#show'
    post   'users',     to: 'users#create'
    patch  'users/:id', to: 'users#update'
    delete 'users',     to: 'users#destroy'
  end
end
