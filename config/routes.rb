Rails.application.routes.draw do

  devise_for :users

  root "schools#index"

  resources :schools do 
    resources :vendors
  end

  resources :vendors do
    post :claim, on: :member
  end

  resources :vendors
  resources :comments
  resources :schools
end
