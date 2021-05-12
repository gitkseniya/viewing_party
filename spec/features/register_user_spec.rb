require 'rails_helper'

RSpec.describe 'User registration form' do
  it 'Takes you to a form to create a new user' do
    visit root_path

    click_link 'Register As A User'

    fill_in 'user[email]', with: 'alex@example.com'
    fill_in 'user[password]', with: 'strongpassword'

    click_button 'Register'

    # save_and_open_page

    expect(page).to have_content('Welcome alex@example.com!')
  end

  scenario "It keeps a user logged in after registering" do
    visit root_path

    click_link 'Register As A User'

    fill_in 'user[email]', with: "email@email.com"
    fill_in 'user[password]', with: "strongpassword"

    click_on "Register"

    visit '/profile'

    expect(page).to have_content("Hello, email@email.com!")
  end
end