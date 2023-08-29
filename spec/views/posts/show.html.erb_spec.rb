require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  let!(:user) { User.create(name: 'Salma', bio: 'I am a software engineer', photo: 'https://i.imgur.com/5FJXZbU.jpg') }
  let!(:post) { Post.create(title: 'My first post', text: 'This is my first post', author_id: user.id) }
  let!(:comment) { Comment.create(text: 'This is my first comment', author_id: user.id, post_id: post.id) }

  before do
    visit user_post_path(user, post)
  end

  it 'displays the users title' do
    expect(page).to have_content(post.title)
  end

  it 'displays the author of the post' do
    expect(page).to have_content(post.author.name)
  end

  it 'displays the number of comments the post has' do
    expect(page).to have_content(post.comments.count)
  end

  it 'displays the number of likes the post has' do
    expect(page).to have_content(post.likes_counter)
  end

  it 'displays the posts body' do
    expect(page).to have_content(post.text)
  end

  it 'displays the commentor username' do
    expect(page).to have_content(comment.author.name)
  end

  it 'displays the comment' do
    expect(page).to have_content(comment.text)
  end
end
