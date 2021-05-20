require 'rails_helper'

RSpec.describe Movie do
  before :each do
    @parse_movie_info = Movie.new({
      id: 12,
      title: "Finding Nemo",
      vote_average: 7.8,
    })
  end

  it 'can be created' do

    expect(@parse_movie_info.class).to eq(Movie)
  end

  it 'has valid attributes' do

    expect(@parse_movie_info.id).to eq(12)
    expect(@parse_movie_info.title).to eq("Finding Nemo")
    expect(@parse_movie_info.vote_average).to eq(7.8)
  end
end
