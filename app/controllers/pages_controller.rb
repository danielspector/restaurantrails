class PagesController < ApplicationController
  def index
    session[:error] ? @error = true : @error = false
    session[:error] = false
    render :index
  end
end