Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'home/about'
  get 'home/lookup'
  post "/home/lookup" => 'home#lookup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
