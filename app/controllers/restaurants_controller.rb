class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def show
    # if @restaurant
    #   session[:error] = false
    #   erb :rest_page
    # else
    #   session[:error] = true
    #   redirect to("/")
    # end
  end

  def index
    @restaurants = Restaurant.all
    @search = Restaurant.search(params[:q])
    @found_restaurants = @search.result
  end
  
  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:id]) 
  end
end