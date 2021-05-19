require 'rails_helper'

describe 'MovieFacade' do
  it "returns a movie object by the movie id", :vcr do
    facade = MovieFacade.movie_info(12)

    expect(facade.title).to eq("Finding Nemo")
  end
end
