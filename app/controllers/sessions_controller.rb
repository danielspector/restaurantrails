class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(facebook_id: session_params[:facebook_id].to_i)
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.new(session_params)
      session[:user_id] = nil
      render 'users/new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    result = ActionController::Parameters.new(request.env["omniauth.auth"]).permit!.require(:info).permit(:name, :email, :location, :image)
    result[:image_url] = result.delete(:image) if result[:image]
    result[:facebook_id] = env["omniauth.auth"][:uid].to_i
    result
  end

end