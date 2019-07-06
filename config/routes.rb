Rails.application.routes.draw do

  get "/schools" => "schools#index"
  get "/schools/:id" => "schools#show", as: :hello

  resources :comments
  resources :vendors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
