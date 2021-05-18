class MovieService
  class << self
    def top_40
      token = ENV['movie_token']

      response1 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{token}&page=1&language=en-US")
      response2 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{token}&page=2&language=en-US")

      result1 = JSON.parse(response1.body, symbolize_names: true)
      result2 = JSON.parse(response2.body, symbolize_names: true)
      result1[:results] + result2[:results]
    end

    def search_result(name)
      token = ENV['movie_token']

      response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=#{token}&language=en-US&query=#{name}&page=1")

      result = JSON.parse(response.body, symbolize_names: true)
      result[:results]
    end

    def movie_info(movie_id)
      response = conn.get("/3/movie/#{movie_id}")
      parse_data(response)
    end

    def retrieve_reviews(movie_id)
      response = conn.get("/3/movie/#{movie_id}/reviews")
      parse_data(response)[:results]
    end

    def retrieve_cast(movie_id)
      response = conn.get("/3/movie/#{movie_id}/credits")
      parse_data(response)[:cast][0..9]
    end

    def upcoming_movies
      response = conn.get('/3/movie/upcoming')
      parse_data(response)[:results]
    end

    def alternative_titles(movie_id)
      response = conn.get("/3/movie/#{movie_id}/alternative_titles")
      parse_data(response)[:titles].first(5)
    end


    private

    def conn
      Faraday.new(url: 'https://api.themoviedb.org', params: { "api_key": ENV['movie_token'], "language": 'en-US' })
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
