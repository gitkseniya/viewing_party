require 'rails_helper'

describe 'movie' do
  it 'shows movie attributes' do
    data =  {
      "id": 12,
      "title": "Finding Nemo",
      "vote_average": 7.8,
  }

    movie = Movie.new(data)

    expect(movie.id).to eq(12)
    expect(movie.title).to eq("Finding Nemo")
    expect(movie.vote_average).to eq(7.8)
  end
end
