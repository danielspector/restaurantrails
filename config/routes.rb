RestaurantRails::Application.routes.draw do
get '/cuisine/:id' => 'cuisines#show', as: 'cuisine'
get '/cuisines' => 'cuisines#index', as: 'cuisines'

get '/pages/' => 'pages#index', as: 'home'
post '/pages/' => 'pages#search', as: 'search'

get '/restaurant/:id' => 'restaurants#show', as: 'restaurant'
get '/restaurants' => 'restaurants#index', as: 'restaurants'

get '/violation/:id' => 'violations#show', as: 'violation'
get '/violations' => 'violations#index', as: 'violations'

get '/zipcode/:zip' => 'zipcodes#show', as: 'zip'


end
