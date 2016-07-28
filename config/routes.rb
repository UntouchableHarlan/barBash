Rails.application.routes.draw do
  root 'welcome#home'

  root 'owners#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'owners#new'


  resources :drinks
  resources :owners
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
