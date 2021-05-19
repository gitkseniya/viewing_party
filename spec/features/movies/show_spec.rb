require 'rails_helper'

RSpec.describe "Movies Show Page", type: :feature do
  before :each do
    @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit movie_path(12)
  end

  describe "As an authenticated user," do
    it 'has a button to create a viewing party', :vcr do
      expect(page).to have_link("Create a Viewing Party")
    end

    it 'shows information about the movie', :vcr do
      expect(page).to have_content("Finding Nemo")
      expect(page).to have_content(7.8)
      expect(page).to have_content("Animation")
    end

    it 'has information about the first 10 cast members', :vcr do
      expect(page).to have_content("Ellen DeGeneres")
    end

    it 'Count of total reviews and each reviews author and info', :vcr do
      expect(page).to have_content("3 review(s)")
      expect(page).to have_content("Dave09")
      expect(page).to have_content("Awesome ocean visuals")
    end

    it 'shows first 5 alternative titles', :vcr do
      expect(page).to have_content("Finding Nemo 3D")
    end
  end
end
