class ViolationsController < ApplicationController
  before_action :set_violation, only: [:show]
  
  get '/violation/:vio_id' do
    if @violation
      session[:error] = false
      erb :vio_page
    else
      session[:error] = true
      redirect to("/")
    end
  end

  private
  
  def set_violation
    @violation = Violation.find(params[:id]) 
  end
  
end