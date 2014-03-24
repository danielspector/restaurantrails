class SessionsController < ApplicationController

  def new
  end

  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Invalid login!  Try again!"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path, notice: "You have signed out"
  end

end