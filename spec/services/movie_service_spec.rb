require 'rails_helper'

RSpec.describe MovieService do
  describe 'happy path' do
    it 'grabs top forty movies' do

      VCR.use_cassette('top forty movies') do

        data = MovieService.top_forty

        expect(data).to be_a(Array)

        first_data = data[0]
        expect(first_data).to have_key(:id)
        expect(first_data).to have_key(:title)
        expect(first_data).to have_key(:vote_average)
      end
    end

    it 'grabs the search results' do

      VCR.use_cassette('search results') do

        data = MovieService.search_result('Finding Nemo')

        expect(data).to be_a(Array)

        first_data = data[0]
        expect(first_data).to have_key(:id)
        expect(first_data).to have_key(:title)
        expect(first_data).to have_key(:vote_average)
      end
    end

    it 'can parse movie details from movie id' do
      VCR.use_cassette('parse movie details') do

        data = MovieService.search_result(12)

        expect(data).to be_a(Array)

        first_data = data[0]
        expect(first_data).to have_key(:id)
        expect(first_data).to have_key(:title)
        expect(first_data).to have_key(:vote_average)
      end
    end

    it 'can retrieve reviews' do
      VCR.use_cassette('reviews') do

        data = MovieService.retrieve_reviews(12)

        expect(data).to be_a(Array)

        first_data = data[0]
        expect(first_data).to have_key(:author)
        expect(first_data).to have_key(:content)
      end
    end

    it 'can retrieve cast names' do
      VCR.use_cassette('cast details') do

        data = MovieService.retrieve_cast(12)

        expect(data).to be_a(Array)

        first_data = data[0]
        expect(first_data).to have_key(:name)
        expect(first_data).to have_key(:character)
      end
    end

    it 'can grab upcoming movies' do
      VCR.use_cassette('upcoming movies') do

        data = MovieService.upcoming_movies

        expect(data).to be_a(Array)

        first_data = data[0]
        expect(first_data).to have_key(:id)
        expect(first_data).to have_key(:title)
        expect(first_data).to have_key(:vote_average)
      end
    end

    it 'can grab alternative_titles' do
      VCR.use_cassette('alternate titles') do

        data = MovieService.alternative_titles(12)

        expect(data).to be_a(Array)

        first_data = data[0]
        expect(first_data).to have_key(:title)
        expect(first_data).to have_key(:type)
      end
    end
  end
end
