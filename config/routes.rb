Rails.application.routes.draw do

 
  root "projects#index"

  resources :sessions, only: [:new, :create, :destroy]

  resources :users 
  
  resources :projects do
    resources :pledges
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
