require 'rails_helper'

RSpec.describe "dashboard discover movies" do
  before :each do
    @user1 = create(:user)

    visit root_path

    click_link 'Log In'

    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password

    click_button 'Log In'

    visit dashboard_path
  end

  describe "when I visit Discover Movies" do
    it "has a button to show top 40 movies", :vcr do

     click_link "Discover Movies"
     expect(current_path).to eq(discover_path)

      expect(page).to have_button("Top 40")
      click_button("Top 40 Movies")
      expect(current_path).to eq(movies_path)
    end

    it "can search for movies by the movie title", :vcr do
      visit discover_path

      expect(page).to have_field(:search)
      fill_in :search, with: "Nobody"
      click_button("Search")

      expect(current_path).to eq(movies_path)
      expect(page).to have_content("Nobody")
    end
  end
end
