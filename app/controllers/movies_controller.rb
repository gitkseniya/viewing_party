class MoviesController < ApplicationController

  def index
    if params[:search]
      @movies = MovieService.search_result(params[:search])
    elsif params[:top_40]
      @movies = MovieService.top_40
    elsif params[:upcoming_movies]
      @movies = MovieService.upcoming_movies
    else
      redirect_to discover_path
    end
  end

  def show
    @movie = MovieService.movie_info(params[:id])
    @casts = MovieService.retrieve_cast(params[:id])
    @reviews = MovieService.retrieve_reviews(params[:id])
    @alternative_titles = MovieService.alternative_titles(params[:id])
  end
end
