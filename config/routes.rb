Rails.application.routes.draw do

  resources :schools do 
    resources :vendors
  end

  resources :comments
  resources :vendors
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
