Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  
  root "folders#index"

  resources :folders
  get 'users_folders', to: 'folders#users_folders', as: 'users_folders'
  get 'users_friends', to: 'users#users_friends', as: 'users_friends'

  post 'new_link', to: 'links#new_link', as: 'new_link'

  resources :shared_baskets, only: [:show, :create]
  resources :shared_links
end
