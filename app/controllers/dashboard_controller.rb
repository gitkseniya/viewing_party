class DashboardController < ApplicationController
  def index
    if !session[:user_id]
      flash[:info] = 'You need to log in to view your dashboard buddy'
      redirect_to login_path
    else
      @friends = current_user.friends

    end
  end
  private
  def name
     @movie[:title]
  end
end
