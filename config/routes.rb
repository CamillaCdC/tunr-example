Rails.application.routes.draw do
  get 'mixtapes/new'
  get 'session/new'
  # get 'pages/home'
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :index]

  # HTTP verbs
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destory'

  resources :mixtapes, :only => [:new, :create, :show, :edit]
end
