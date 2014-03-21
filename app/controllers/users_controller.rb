class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  before_action :login_required, :only => [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
    @cuisines = Cuisine.all
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to restaurants_path 
    end
  end

  def edit
    @cuisines = Cuisine.all
  end

  def update
    @user.update(user_params)

    if @user.save
      redirect_to @user, notice: "User successfully edited"
    else
      render 'edit', notice: "Something went wrong"
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to new_user_path, notice:  "Sorry to see you go :'("
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :zipcode_list, :restaurant_list, :cuisine_list)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
