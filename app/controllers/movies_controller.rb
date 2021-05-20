class MoviesController < ApplicationController
  def index
    if params[:search].present?
      @movies = MovieService.search_result(params[:search])
    elsif params[:top_forty]
      @movies = MovieService.top_forty
    elsif params[:upcoming_movies]
      @movies = MovieService.upcoming_movies
    else
      empty_field
      redirect_to discover_path
    end
  end

  def show
    # binding.pry
    @movie = MovieService.movie_info(params[:id])
    @casts = MovieService.retrieve_cast(params[:id])
    @reviews = MovieService.retrieve_reviews(params[:id])
    @alternative_titles = MovieService.alternative_titles(params[:id])
  end

  private

  def empty_field
    params[:search].empty?
    flash[:notice] = 'Please fill in movie title'
  end
end
