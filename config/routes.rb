RestaurantRails::Application.routes.draw do
get '/cuisines/:id' => 'cuisines#show', as: 'cuisine'
get '/cuisines' => 'cuisines#index', as: 'cuisines'

get '/pages/' => 'pages#index', as: 'home'
post '/pages/' => 'pages#search', as: 'search'

get '/restaurants' => 'restaurants#index', as: 'restaurants'
post 'restaurants' => 'restaurants#index'
post "/restaurants/add_restaurant" => 'restaurants#add_restaurant'
get '/restaurants/:id' => 'restaurants#show', as: 'restaurant'

get '/violations/:id' => 'violations#show', as: 'violation'
get '/violations' => 'violations#index', as: 'violations'

get '/zipcodes/:id' => 'zipcodes#show', as: 'zip'
get '/zipcodes' => 'zipcodes#index'


delete '/sessions' => 'sessions#destroy'
get '/sessions/new' => 'sessions#new', as: 'new_session'
post '/sessions' => 'sessions#login'


get "/users/new" => 'users#new', as: "new_user"
post "/users" => 'users#create'

get "/users/:id/edit" => 'users#edit', as: "edit_user"
patch "/users/:id" => 'users#update'

get "/users/:id" => 'users#show', as: "user"

delete "/users/:id" => 'users#destroy'

root 'pages#index'

end
