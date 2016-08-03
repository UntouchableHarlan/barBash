Rails.application.routes.draw do


  get 'payments/new'

  get 'payments/thanks'

  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'owners#new'
  get '/bars/edit' => 'bars#editpage'
  patch '/bars/edit' => 'bars#edit'
  get '/beers' => 'welcome#beers'
  get '/time' => 'welcome#get_time'
  get '/sale' => 'welcome#add_sale'
  get '/updateprices' => 'welcome#updateprices'

  resources :drinks
  resources :owners
  resources :sessions
  resources :payments, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
