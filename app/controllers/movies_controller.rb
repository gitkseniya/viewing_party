class MoviesController < ApplicationController

  def index
    if !params[:search].nil?
      redirect_to discover_path
      flash[:notice] = "Please fill in movie title"
    elsif
      params[:search]
      @movies = MovieService.search_result(params[:search])
    elsif params[:top_40]
      @movies = MovieService.top_40
    else params[:upcoming_movies]
      @movies = MovieService.upcoming_movies
    end
  end

  def show
    @movie = MovieService.movie_info(params[:id])
    # @movie = MovieFacade.movie_info(params[:id])
    @casts = MovieService.retrieve_cast(params[:id])
    @reviews = MovieService.retrieve_reviews(params[:id])
    @alternative_titles = MovieService.alternative_titles(params[:id])
  end
end
