require 'rails_helper'

RSpec.describe "posts index page", type: :feature do
  let!(:user) { User.create(name: "Salma", bio: "I am a software engineer", photo: "https://i.imgur.com/5FJXZbU.jpg") }
  let!(:post) { Post.create(title: "My first post", text: "This is my first post", author_id: user.id) }
  let!(:comment) { Comment.create(text: "This is my first comment", author_id: user.id, post_id: post.id) }

  before do
    visit user_posts_path(user.id)
  end

  it "displays the users profile picture" do
    expect(page).to have_selector("img[src='#{user.photo}']")
  end

  it "displays the users name" do
    expect(page).to have_content(user.name)
  end

  it "displays the number of posts the user has written" do
    expect(page).to have_content(user.posts.count)
  end

  it "displays the title of the post" do
    expect(page).to have_content(post.title)
  end

  it "displays the first five comments" do
    expect(page).to have_content(comment.text)
  end

  it "displays the number of comments the post has" do 
    expect(page).to have_content(post.comments.count)
  end

  it "displays the number of likes the post has" do
    expect(page).to have_content(post.likes_counter)
  end

  it "displays the pagination button" do 
    expect(page).to have_button("pagination")
  end

  it "displays post show page when I click on the post title" do
    click_link post.title
    expect(page).to have_current_path(user_post_path(post.id, user.id))
  end
end
