class MoviesController < ApplicationController

  def index
    if params[:search]
      @movies = MovieService.search_result(params[:search])
    elsif params[:top_40]
      @movies = MovieService.top_40
    else
      redirect_to discover_path
    end
  end

  def show
  end
end
