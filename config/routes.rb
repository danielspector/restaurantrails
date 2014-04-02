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

get '/users/:id/remove_restaurant_from_profile' => 'users#remove_restaurant_from_profile', as: 'remove_restaurant_from_profile'
get '/users/:id/remove_violation_from_profile' => 'users#remove_violation_from_profile', as: 'remove_violation_from_profile'

get '/violations/:id' => 'violations#show', as: 'violation'
get '/violations' => 'violations#index', as: 'violations'
get "/violations/add_violation/:id" => 'violations#add_violation', as: 'add_violation'
get '/violations/remove_violation/:id' => 'violations#remove_violation', as: 'remove_violation'

get '/zipcodes/:id' => 'zipcodes#show', as: 'zip'
get '/zipcodes' => 'zipcodes#index'
get "/zipcodes/add_zipcode/:id" => 'zipcodes#add_zipcode', as: 'add_zipcode_show'
get '/zipcodes/remove_zipcode/:id' => 'zipcodes#remove_zipcode', as: 'remove_zipcode_show'


delete '/sessions' => 'sessions#destroy'
get '/sessions/new' => 'sessions#new', as: 'new_session'
post '/sessions' => 'sessions#create'
get 'auth/:provider/callback' => 'sessions#create'
get 'auth/failure' => redirect('/')
get 'signout' => 'sessions#destroy', as: 'signout'

get "/users/new" => 'users#new', as: "new_user"
post "/users" => 'users#create'

get "/users/:id/edit" => 'users#edit', as: "edit_user"
patch "/users/:id" => 'users#update'

get "/users/:id" => 'users#show', as: "user"
get "/users/remove_zip/:id" => 'users#remove_zip', as: "remove_zip"
delete "/users/:id" => 'users#destroy', as: "destroy_user"

root 'pages#index'

end
