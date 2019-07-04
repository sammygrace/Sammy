Rails.application.routes.draw do

  get "/schools" => "schools#index"

  resources :comments
  resources :vendors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
