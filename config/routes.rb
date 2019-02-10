Rails.application.routes.draw do
  resources :brands
  root 'guns#index'
  resources :guns
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
