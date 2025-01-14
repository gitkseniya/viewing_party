class PartiesController < ApplicationController
  helper_method :duration_time_check

  def new
    @movie = MovieService.movie_info(params[:api_movie_id])
  end

  def create
    @movie = MovieService.movie_info(params[:api_movie_id])
    return if duration_time_check

    @party = current_user.parties.create(party_params)
    create_guest_list if @party.save
    redirect_to dashboard_path
  end

  private

  def party_params
    params.permit(:name, :api_movie_id, :start_time, :duration, :host_id)
  end

  def duration_time_check
    return unless params[:duration].to_i < @movie[:runtime].to_i

    flash[:error] = 'Party cannot be shorter than the movie'
    render :new
  end

  def create_guest_list
    params[:friends].present?

    params[:friends].each do |friend|
      GuestList.create(party_id: @party.id, friend_id: friend)
    end
  end
end
