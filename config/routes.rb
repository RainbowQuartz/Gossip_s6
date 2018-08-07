Rails.application.routes.draw do
  get 'gossips/index'
  get 'home/index'
  devise_for :users
  root to: "home#index"
  resources :gossips
  get 'gossips/new', to: 'gossips#new'
  post 'gossips/new', to: 'gossips#create'
  delete 'gossips/delete/:id', to: 'gossips#destroy'
  get 'gossips/new', to: 'gossips#show'
  delete 'gossips/delete', to: 'gossips#destroy'
  get 'gossips/edit/:id', to: 'gossips#edit'
  post 'gossips/edit/:id', to: 'gossips#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
