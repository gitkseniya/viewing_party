class MovieService
  class << self
    def top_forty
      response1 = conn.get('/3/movie/top_rated', params: { "page": 1 })
      response2 = conn.get('/3/movie/top_rated', params: { "page": 2 })

      result1 = parse_data(response1)
      result2 = parse_data(response1)

      result1[:results] + result2[:results]
    end

    def search_result(name)
      conn1 = Faraday.new(url: 'https://api.themoviedb.org',
                          params: { "api_key": ENV['movie_token'], "language": 'en-US', "query": name, "page": 1 })
      conn2 = Faraday.new(url: 'https://api.themoviedb.org',
                          params: { "api_key": ENV['movie_token'], "language": 'en-US', "query": name, "page": 2 })

      response1 = conn1.get('/3/search/movie')
      response2 = conn2.get('/3/search/movie')

      result1 = parse_data(response1)
      result2 = parse_data(response2)

      result1[:results] + result2[:results]
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
