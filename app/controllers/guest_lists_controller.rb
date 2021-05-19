class GuestListsController < ApplicationController
  def show
    @pary = Party.find(params[:id])
  end

  def create
    @pary = Party.find(params[:id])
    GuestList.create(party_id: @party, friend_id: friend.id)
  end
end
# pending
# attenfing
