Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :magic_items
  get '/search', to: "magic_items#search"
end
