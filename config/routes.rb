RestaurantRails::Application.routes.draw do
get '/cuisines/:id' => 'cuisines#show', as: 'cuisine'
get '/cuisines' => 'cuisines#index', as: 'cuisines'

get '/pages/' => 'pages#index', as: 'home'
post '/pages/' => 'pages#search', as: 'search'

get '/restaurants' => 'restaurants#index', as: 'restaurants'
post 'restaurants' => 'restaurants#index'
get "/restaurants/add_restaurant/:id" => 'restaurants#add_restaurant', as: 'add_restaurant'
get "/restaurants/remove_restaurant/:id" => 'restaurants#remove_restaurant', as: 'remove_restaurant'
get '/restaurants/:id' => 'restaurants#show', as: 'restaurant'

get '/violations/:id' => 'violations#show', as: 'violation'
get '/violations' => 'violations#index', as: 'violations'

get '/zipcodes/:id' => 'zipcodes#show', as: 'zip'
get '/zipcodes' => 'zipcodes#index'


delete '/sessions' => 'sessions#destroy'
get '/sessions/new' => 'sessions#new', as: 'new_session'
post '/sessions' => 'sessions#create'
get 'auth/:provider/callback' => 'sessions#create'
get 'auth/failure' => redirect('/')
get 'signout' => 'sessions#destroy'

get "/users/new" => 'users#new', as: "new_user"
post "/users" => 'users#create'

get "/users/:id/edit" => 'users#edit', as: "edit_user"
patch "/users/:id" => 'users#update'

get "/users/:id" => 'users#show', as: "user"
get "/users/remove_zip/:id" => 'users#remove_zip', as: "remove_zip"
delete "/users/:id" => 'users#destroy'

root 'pages#index'

end
