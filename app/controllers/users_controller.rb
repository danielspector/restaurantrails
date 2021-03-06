class UsersController < ApplicationController
  before_action :login_required, :only => [:show, :edit, :update, :destroy]
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  
  def new
    redirect_if_wrong_profile if signed_in?
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Your form filling-in skills are lacking.  Try again!"
      render 'new'
    end
  end

  def edit
    redirect_if_wrong_profile
  end

  def update
    @user.update(user_params)
    if @user.save
      flash[:notice] = "User successfully edited"
      redirect_to @user
    else
      flash[:notice] = "Something went wrong.  Try again."
      render 'edit'
    end
  end

  def show
    redirect_if_wrong_profile
  end

  def destroy
    current_user.destroy
    redirect_to '/signout'
  end

  def remove_violation_from_profile
    current_user.user_violations.find_by(violation_id: params[:id]).destroy 
  end

  def remove_restaurant_from_profile
    current_user.user_restaurants.find_by(restaurant_id: params[:id]).destroy 
  end

  def remove_zip
    current_user.user_zipcodes.find_by(zipcode_id: Zipcode.find_by(zip: params[:id]).id)
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :facebook_id, :location, :image_url, :zipcode_list, :restaurant_list, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def is_correct_user?
    current_user ? current_user.id == params[:id].to_i : false
  end

  def redirect_if_wrong_profile
    if !is_correct_user?
      if signed_in?
        redirect_to current_user
      else
        redirect_to new_session_path
      end
    end    
  end

end





