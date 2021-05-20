class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show; end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:info] = "Welcome #{new_user.email}!"
      redirect_to root_path
    else
      invalid_credentials
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def invalid_credentials
    flash[:error] = 'Password does not match.  Please try again'
    redirect_to new_user_path
  end
end
