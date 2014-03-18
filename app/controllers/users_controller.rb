class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  before_action :login_required, :only => [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, :notice => "User successfuly created"
    else
        # flash[:notice] = "Restaurant name invalid"
      render 'new' 
    end
  end

  def edit
  end

  def update
    @user.update(user_params)

    if @user.save
      redirect_to @user, :notice => "User successfully edited"
    else
      render 'edit' 
    end
  end

  def show
  end

  def destroy
    @user.destroy

    redirect_to new_user_path, :notice =>  "Sorry to see you go :'("
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :zipcode_list, :restaurant_list, :cuisine_list)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
