class CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show]

  def show
  end  

  def index
    @cuisines = Cuisine.all
  end

  private

  def set_cuisine
    @cuisine = Cuisine.friendly.find(params[:id]) 
  end
end