Rails.application.routes.draw do
  
  root 'guns#index'
  resources :brands
  resources :guns

  namespace :api, :defaults => {:format => :json} do
  	resources :guns
  end
end
