RestaurantRails::Application.routes.draw do
get '/cuisine/:id' => 'cuisines#show', as: 'cuisine'
get '/pages/' => 'pages#index'

get '/restaurant/:id' => 'restaurants#show', as: 'restaurant'
get '/violation/:id' => 'violations#show', as: 'violation'
get '/zipcode/:id' => 'zipcodes#show', as: 'zip'


end
