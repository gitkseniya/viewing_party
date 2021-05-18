require 'rails_helper'
RSpec.describe "Movies Show Page", type: :feature do
  before :each do
    @user1 = User.create!(username: 'user1', email: 'user1@email.com', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
  end

  describe "As an authenticated user," do
  it 'I see information about the movie' do

    end
  end

  it 'has a button to create a viewing party' do

  end
end
