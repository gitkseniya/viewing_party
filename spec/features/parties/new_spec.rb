require 'rails_helper'

RSpec.describe 'viewing party index', type: :feature do
  before :each do
    @user1 = create(:user, username: "SadCoderShark101")
    @user2 = create(:user, username: "pebbles")
    @user3 = create(:user, username: "Gray")
    @user4 = create(:user, username: "wat3r")

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

  it 'takes user to a create party form', :vcr do

    expect(page).to have_link('Create a Viewing Party')
    click_link 'Create a Viewing Party'

    expect(current_path).to eq(new_party_path)
  end

  it 'has a form for a new party', :vcr do
    click_link 'Create a Viewing Party'

    expect(page).to have_content("The Dark Knight")
    expect(page).to have_field("duration")
    expect(page).to have_field(:start_time)

    # page.should have_css("input[type='checkbox']", id: "friends_#{@user2.id}")
  end

  it 'creates a new party', :vcr do
    click_link 'Create a Viewing Party'

    fill_in :start_time, with: Time.now
    check(@user2.email)
    click_button 'Create Viewing Party'
  end

  it 'Post created party to dashboard view', :vcr do
    click_link 'Create a Viewing Party'

    fill_in('duration', :with => 200)
    fill_in :start_time, with: Time.now
    check(@user2.email)
    click_button 'Create Viewing Party'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("The Dark Knight")
  end

  it 'party duration is less than movie runtime, return flash message and render new page', :vcr do
    click_link 'Create a Viewing Party'

    expect(page).to have_field("duration")

    fill_in('duration', :with => 20)
    fill_in :start_time, with: Time.new(2021,6,21, 13,30,0, "+09:00").utc
    check(@user2.email)
    click_button 'Create Viewing Party'

    expect(page).to have_content("Party cannot be shorter than the movie")
  end

  it "Can invite friends to Party", :vcr do
    click_link 'Create a Viewing Party'

    fill_in('duration', :with => 200)
    fill_in :start_time, with: Time.now
    check(@user2.email)
    click_button 'Create Viewing Party'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content(@user2.email)
  end
end
