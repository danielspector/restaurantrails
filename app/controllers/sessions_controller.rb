class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if env["omniauth.auth"]
      @user = User.find_by(facebook_id: facebook_params[:facebook_id].to_i)
      if !@user
        @user = User.create(facebook_params)
        create_dummy_pw
        @user.save
      end
      session[:user_id] = @user.id
      redirect_to @user
    else
      if @user = User.find_by(email: regular_params[:email]).try(:authenticate, regular_params[:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:notice] = "Incorrect login!  Try again!"
        render 'new'
      end
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def facebook_params
    result = ActionController::Parameters.new(request.env["omniauth.auth"]).permit!.require(:info).permit(:name, :email, :location, :image)
    result[:image_url] = result.delete(:image) if result[:image]
    result[:facebook_id] = env["omniauth.auth"][:uid].to_i
    result
  end

  def regular_params
    params.require(:user).permit(:email, :password)
  end

  def create_dummy_pw
    pw = Time.now.to_s
    @user.password = pw
    @user.password_confirmation = pw
  end

end