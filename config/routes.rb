Rails.application.routes.draw do

  # Models
  root 'guns#index'
  resources :brands
  resources :guns

  # Users
  resources :users
  put 'users/:id/add_gun_to_favorites/:gun_id' => 'users#add_gun_to_favorites'
  put 'users/:id/remove_gun_from_favorites/:gun_id' => 'users#remove_gun_from_favorites'
  resources :sessions, only: [:new, :create, :destroy] 
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  # API Stuff
  namespace :api, :defaults => {:format => :json} do
  	resources :guns
  	resources :brands do 
  		resources :guns
  	end
  end
end
