RestaurantRails::Application.routes.draw do
get '/cuisine/:id' => 'cuisines#show', as: 'cuisine'
get '/cuisines' => 'cuisines#index', as: 'cuisines'

get '/pages/' => 'pages#index'

get '/restaurant/:id' => 'restaurants#show', as: 'restaurant'
get '/restaurants' => 'restaurants#index', as: 'restaurants'

get '/violation/:id' => 'violations#show', as: 'violation'
get '/violations' => 'violations#index', as: 'violations'

# get '/zipcode/:id' => 'zipcodes#show', as: 'zip'


end
