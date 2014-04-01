class ViolationsController < ApplicationController
  before_action :set_violation, only: [:show]

  def show
    # if @violation && session[:error] = true
    #   redirect_to(pages_path)
    # end
  end

  def index
    @violations = Violation.all
    @search = Violation.search(params[:q])
    @found_violations = @search.result
    # @most_common = Violation.most_common
  end

  def add_violation
    @user = current_user
    v = Violation.find(params[:id])
    @user.violations << v
  end

  def remove_violation
    @user = current_user
    @user.user_violations.find_by(violation_id: params[:id]).destroy
  end

  private
  
  def set_violation
    @violation = Violation.find(params[:id]) 
  end
  
end