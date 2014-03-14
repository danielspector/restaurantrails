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
  end
  
  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id]) 
  end
end