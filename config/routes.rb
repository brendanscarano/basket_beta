Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'about', to: 'users#about', as: 'about'

  resources :sessions, only: [:create, :destroy]
  
  resources :folders
  resources :links, only: [:destroy]
  resources :shared_baskets, only: [:show, :create]
  resources :shared_links

  root "users#about"

  #Extension Routes
  #============================
  get 'users_folders', to: 'folders#users_folders', as: 'users_folders'
  get 'users_friends', to: 'users#users_friends', as: 'users_friends'

  post 'new_link', to: 'links#new_link', as: 'new_link'
  post 'sent_link', to: 'shared_links#sent_link', as: 'sent_link'
end
