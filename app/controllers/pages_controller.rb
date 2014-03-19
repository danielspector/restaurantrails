class PagesController < ApplicationController
  def index
    session[:error] ? @error = true : @error = false
    session[:error] = false
    render :index
  end

  def search
    @search = Restaurant.search(params[:q])
  end



end