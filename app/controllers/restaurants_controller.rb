class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :login_required, :only => [:add_restaurant]

  def show
  end

  def add_restaurant
    @user = current_user
    r = Restaurant.find(params[:id])
    @user.restaurants << r if !@user.restaurants.include?(r)
  end

  def remove_restaurant
    @user = current_user
    @user.user_restaurants.where(restaurant_id: params[:id]).destroy_all
  end

  def index
    if params[:q]
      if params[:q][:name_cont].length < 3
        flash[:notice] = "Your search must be at least 3 characters long!"
        params.delete(:q)
      end
    end
    @search = Restaurant.search(params[:q])
    @found_restaurants = @search.result
  end
  
  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:id]) 
  end
end