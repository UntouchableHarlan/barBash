Rails.application.routes.draw do


  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'owners#new'




  get '/bars/edit' => 'bars#editpage'
  patch '/bars/edit' => 'bars#edit'
  get '/beers' => 'welcome#beers'

  resources :drinks
  resources :owners
  resources :sessions
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
