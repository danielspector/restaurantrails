class CuisinesController < ApplicationController
  before_action :set_cuisine, only: [:show]
  extend FriendlyId

  friendly_id :description

  def show
    # if Cuisine.exists?(id: @cuis_id)
    #   session[:error] = false
    # else
    #   session[:error] = true
    #   redirect_to(pages_path)
    # end
  end  

  def index
    @cuisines = Cuisine.all
  end

  private

  def set_cuisine
    @cuisine = Cuisine.find(params[:id]) 
  end
end