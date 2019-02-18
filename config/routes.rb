Rails.application.routes.draw do
  
  root 'guns#index'
  resources :brands
  resources :guns

  namespace :api, :defaults => {:format => :json} do
  	resources :guns
  	resources :brands do 
  		resources :guns
  	end
  end
end
