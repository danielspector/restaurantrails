class ZipcodesController < ApplicationController 
  before_action :set_zipcode, only: [:show]
   
  def show
    @zip = Zipcode.find_by(zip: params[:id])
    binding.pry
    @worst = @zip.restaurants.order(score: :desc).limit(3)
    @restaurants = @zip.bad_restaurants.sort {|a,b| b.score <=> a.score}
  end

  def index
    @search = Zipcode.search(params[:q])
    if params[:q] && params[:q][:zip_cont]
      if params[:q][:zip_cont].length != 5 || !Zipcode.find_by(zip: params[:q][:zip_cont])
        flash[:notice] = "Invalid zipcode or not in NYC!"
        params.delete(:q)
      else
        @found_zip = @search.result
        redirect_to "/zipcodes/#{@found_zip.first.zip}"
      end
    end
  end

  def add_zipcode
    @user = current_user
    z = Zipcode.find(params[:id])
    @user.zipcodes << z if @user != nil
    respond_to do |format|
      format.js
    end  
  end

  def remove_zipcode
    @user = current_user
    @user.user_zipcodes.find_by(zipcode_id: params[:id]).destroy
  end

  private
  
  def set_zipcode
    @zipcode = Zipcode.friendly.find(params[:id]) 
  end
end