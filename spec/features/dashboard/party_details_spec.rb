require 'rails_helper'

RSpec.describe 'user dashboard' do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @user4 = create(:user)
    @party = @user1.parties.create!(name: "name", start_time: Time.new(2021), api_movie_id: 550)
    @guest1 = @party.guest_lists.create!(friend_id: @user2.id)
    @guest2 = @party.guest_lists.create!(friend_id: @user3.id)

    visit root_path

    click_link 'Log In'

    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password

    click_button 'Log In'

    visit dashboard_path
  end

  describe "Viewing Parties Section" do
    it 'shows viewing parties that i am hosting', :vcr do

      expect(page).to have_content("Parties")
      expect(page).to have_link(@party.name)
      # expect(page).to have_content(@party.start_time.strftime("at %I:%M%p"))
      expect(page).to have_content(@user2.email)
      expect(page).to have_content(@user3.email)
    end
  end
end


#
#   As an authenticated user,
# I should see the viewing parties I have been invited to with the following details:
#
# Movie Title, which links to the movie show page
# Date and Time of Event
# who is hosting the event
# list of friends invited, with my name in bold
# I should also see the viewing parties that I have created with the following details:
#
# Movie Title, which links to the movie show page
# Date and Time of Event
# That I am the host of the party
# List of friends invited to the viewing party
