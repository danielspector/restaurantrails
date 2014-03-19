RestaurantRails::Application.routes.draw do
get '/cuisine/:id' => 'cuisines#show', as: 'cuisine'
get '/cuisines' => 'cuisines#index', as: 'cuisines'

get '/pages/' => 'pages#index', as: 'home'
post '/pages/' => 'pages#search', as: 'search'

get '/restaurant/:id' => 'restaurants#show', as: 'restaurant'
get '/restaurants' => 'restaurants#index', as: 'restaurants'
post 'restaurants' => 'restaurants#index'

get '/violation/:id' => 'violations#show', as: 'violation'
get '/violations' => 'violations#index', as: 'violations'

get '/zipcode/:id' => 'zipcodes#show', as: 'zip'


delete '/sessions' => 'sessions#destroy'
get '/sessions/new' => 'sessions#new', as: 'new_session'
post '/sessions' => 'sessions#login'


get "/users/new" => 'users#new', as: "new_user"
post "/users" => 'users#create'

get "/users/:id/edit" => 'users#edit', as: "edit_user"
patch "/users/:id" => 'users#update', as: "user"

get "/users/:id" => 'users#show'

delete "/users/:id" => 'users#destroy'

root 'pages#index'

end
