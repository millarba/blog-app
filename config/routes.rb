Rails.application.routes.draw do
  
  get '/' => 'posts#index'
  get '/post/new' => 'posts#new'
  post '/post' => 'posts#create'
  get '/post/:id' => 'posts#show'
  get '/post_user' => 'posts#user_post'
  get '/post/:id/edit' => 'posts#edit'
  patch '/post/:id' => 'posts#update'
  delete '/post/:id' => 'posts#destroy'

  get '/category/new' => 'categories#new'
  post '/category' => 'categories#create'

  get '/signup' => 'users#new'
  post '/user' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
