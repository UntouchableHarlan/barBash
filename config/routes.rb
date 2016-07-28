Rails.application.routes.draw do
<<<<<<< HEAD


  root 'welcome#home'
=======
  root 'welcome#home'

  root 'owners#new'
>>>>>>> 73099c4f0805b39a4f55040b3d3808775d52f2e3
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'owners#new'
  get '/bars/edit' => 'bars#edit'

  resources :drinks
  resources :owners
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
