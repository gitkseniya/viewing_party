class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = "Welcome #{user.email}!"
      redirect_to root_path
    else
      flash[:error] = 'Your email or password are incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = 'You have been logged out'
    redirect_to root_path
  end
end
