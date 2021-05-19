class MovieFacade
  class << self

    def movie_info(id)
      movie = MovieService.movie_info(id)
      Movie.new(movie)
    end

  end
end
