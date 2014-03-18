class ZipcodesController < ApplicationController 
  before_action :set_zipcode, only: [:show]
   
  def show
    @zip = Zipcode.find_by(zip: params[:id])
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