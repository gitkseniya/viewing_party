class PartiesController < ApplicationController
  before_action :find_movie
  helper_method :duration_time_check

  def new
    @movie = MovieService.movie_info(params[:api_movie_id])
  end

  def create
    @movie = MovieService.movie_info(params[:api_movie_id])
    current_user.parties.create(
                                  api_movie_id: params[:api_movie_id],
                                  start_time: params[:start_time],
                                  duration: params[:duration],
                                  host_id: current_user.id,
                                 )

    redirect_to dashboard_path

  end

  private

  def find_movie
    @movie = MovieService.movie_info(params[:api_movie_id])
  end

  def duration_time_check
    if params[:duration] < @movie[:duration]
      return
        flash[:error] = "Party cannot be shorter than the movie"
        render :new
      else
    end
  end
end
