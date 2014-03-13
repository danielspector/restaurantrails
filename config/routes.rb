Restaurant::Application.routes.draw do
get '/cuisine/:id' => 'cuisines#show'

end
