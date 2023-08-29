require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:user) { User.create(name: 'Salma', bio: 'I am a software engineer', photo: 'https://i.imgur.com/5FJXZbU.jpg') }
  before do
    visit users_path
  end

  it 'displays the users profile picture' do
    expect(page).to have_selector("img[src='#{user.photo}']")
  end

  it 'displays the users name' do
    expect(page).to have_content(user.name)
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content(user.posts.count)
  end

  it 'displays the users show page when I click on the users name' do
    click_link user.name
    expect(page).to have_current_path(user_path(user))
  end
end
