class FriendshipsController < ApplicationController
  def create
    user = current_user
    friend = User.find_by(email: params[:email])

    if friend
      Friendship.create(user_id: user.id, friend_id: friend.id)
    else
      flash[:error] = 'Unable to create friendship'
    end

    redirect_to dashboard_path
  end
end
