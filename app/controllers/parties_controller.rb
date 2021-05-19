class PartiesController < ApplicationController

  def new
    @movie = MovieService.movie_info(params[:api_movie_id])
  end

  def create
    @movie = MovieService.movie_info(params[:api_movie_id])
    current_user.parties.create(api_movie_id: params[:api_movie_id])

    redirect_to new_party_path
  end
end
