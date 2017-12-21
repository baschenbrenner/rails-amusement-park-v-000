Rails.application.routes.draw do

  post '/attractions', to: 'attractions#create'

  get '/attractions', to: 'attractions#index', as: 'attractions_index'
  
  resources :attractions, only: [:show, :new, :update, :edit]
  
  post '/attractions/:id', to: 'rides#create'
  get 'welcome/home'

  resources :users 
  get '/signin', to: 'sessions#new', as: 'login'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get '/users/new', to: 'users#new', as: 'signup'
  post '/signup' => 'users#create'

  root 'welcome#home'
  
end