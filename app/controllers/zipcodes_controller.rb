class ZipcodesController < ApplicationController 
  before_action :set_zipcode, only: [:show]
   
  def show
    @zip = Zipcode.find_by(zip: params[:id])
  end

  def index
    @search = Zipcode.search(params[:q])
    if params[:q] && params[:q][:zip_cont]
      if params[:q][:zip_cont].length != 5 || params[:q][:zip_cont].to_i.to_s != params[:q][:zip_cont]
        binding.pry
        flash[:errors] = "Invalid zipcode!"
        params.delete(:q)
      else
        @found_zip = @search.result
      end
    end


    if @found_zip == nil || @found_zip == []
      render 'index'
    else
      redirect_to "/zipcodes/#{@found_zip.first.zip}"
    end
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