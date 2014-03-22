class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action :login_required, :only => [:add_restaurant]

  def show
    # if @restaurant
    #   session[:error] = false
    #   erb :rest_page
    # else
    #   session[:error] = true
    #   redirect to("/")
    # end
  end

  def add_restaurant
    @user = current_user
    @user.restaurants << Restaurant.find(params[:restaurant_id])
    redirect_to @user
  end

  def index
    if params[:q]
      if params[:q][:name_cont].length < 3
        flash[:errors] = "Your search must be at least 3 characters long!"
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