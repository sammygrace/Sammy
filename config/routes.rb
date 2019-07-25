Rails.application.routes.draw do

  devise_for :admins
  root "schools#index"

  resources :schools do 
    resources :vendors
  end

  resources :comments
  resources :vendors
  resources :schools
end
