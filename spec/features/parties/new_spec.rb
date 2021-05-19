require 'rails_helper'

RSpec.describe 'viewing party index', type: :feature do
  before :each do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @user4 = create(:user)

    @friendship1 = create(:friendship, user: @user1, friend: @user2)
    @friendship2 = create(:friendship, user: @user1, friend: @user3)
    @friendship3 = create(:friendship, user: @user2, friend: @user3)

    visit root_path

    click_link 'Log In'

    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password

    click_button 'Log In'

    visit movie_path(155)
  end

  it 'creates a viewing party for current user', :vcr do

    expect(page).to have_link('Create a Viewing Party')
    click_link 'Create a Viewing Party'

    expect(current_path).to eq(new_party_path)
  end

  it 'has a form for a new party', :vcr do
    click_link 'Create a Viewing Party'

    expect(page).to have_content("The Dark Knight")
    expect(page).to have_field("Duration")

  end
end
