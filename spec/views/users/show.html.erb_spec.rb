require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  let!(:user) { User.create(name: 'Salma', bio: 'I am a software engineer', photo: 'https://i.imgur.com/5FJXZbU.jpg') }
  let!(:post) { Post.create(title: 'My first post', text: 'This is my first post', author: user) }
  let!(:post2) { Post.create(title: 'My second post', text: 'This is my second post', author: user) }
  let!(:post3) { Post.create(title: 'My third post', text: 'This is my third post', author: user) }
  let!(:post4) { Post.create(title: 'My fourth post', text: 'This is my fourth post', author: user) }
  before do
    visit user_path(user)
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
  it 'displays the users bio' do
    expect(page).to have_content(user.bio)
  end
  it 'displays the first three posts of the user' do
    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)
    expect(page).to have_content(post4.title)
  end
  it 'displays the see all button' do
    expect(page).to have_link('See all posts')
  end

  it 'displays the posts show page when clicking the users posts' do
    click_link post2.title
    expect(current_path).to eq(user_post_path(user, post2))
  end

  it 'displays the posts index page when click see all posts' do
    click_link 'See all posts'
    expect(current_path).to eq "#{user_posts_path(user)}/"
  end
end
