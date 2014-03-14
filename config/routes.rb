RestaurantRails::Application.routes.draw do
get '/cuisines/:id' => 'cuisines#show'
get '/pages/' => 'pages#index'


end
