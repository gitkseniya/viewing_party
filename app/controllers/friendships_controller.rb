class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    friend = User.find_by(email: params[:email]))

    if friend
      Friendship.create(user_id: user.id, friend_id: friend.id)
    else
      flash[:error] = 'Unable to create friendship'
    end

    redirect_to dashboard_index_path
  end
end
