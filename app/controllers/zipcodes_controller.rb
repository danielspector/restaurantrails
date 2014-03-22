class ZipcodesController < ApplicationController 
  before_action :set_zipcode, only: [:show]
   
  def show
    @zip = Zipcode.find_by(zip: params[:id])
    @worst = @zip.restaurants.order(score: :desc).limit(3)
  end

  def index
    @search = Zipcode.search(params[:q])
    if params[:q] && params[:q][:zip_cont]
      if params[:q][:zip_cont].length != 5 || !Zipcode.find_by(zip: params[:q][:zip_cont])
        flash[:errors] = "Invalid zipcode or not in NYC!"
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

  private
  
  def set_zipcode
    @zipcode = Zipcode.friendly.find(params[:id]) 
  end
end