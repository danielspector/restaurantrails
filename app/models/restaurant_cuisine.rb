class RestaurantCuisine < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :cuisine
  belongs_to :zipcode
end