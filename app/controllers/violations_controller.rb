class ViolationsController < ApplicationController
  before_action :set_violation, only: [:show]

  def show
    # if @violation && session[:error] = true
    #   redirect_to(pages_path)
    # end
  end

  def index
    @violations = Violation.all
  end

  private
  
  def set_violation
    @violation = Violation.find(params[:id]) 
  end
  
end