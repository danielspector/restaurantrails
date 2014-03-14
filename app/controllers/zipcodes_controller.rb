class ZipcodesController < ApplicationController 
  before_action :set_violation, only: [:show]
   
  def show
  end

  # def post_up(p)
  #   @zip_url = p.to_i
  #   @worst = Restaurant.worst_restaurant_in_zip(@zip_url, 3)
  #   if !Restaurant.exists?(zip: @zip_url)
  #     session[:error] = true
  #     redirect_to(pages_path)
  #   else
  #     session[:error] = false
  #     render 'show'
  #   end
  # end

  private
  
  def set_zipcode
    @zipcode = Zipcode.friendly.find(params[:id]) 
  end
end