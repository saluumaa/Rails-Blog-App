require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject { User.create(name: 'Salma', photo: 'My photo', bio: 'It is Salma', posts_counter: 0) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if the posts_counter is not an integer' do
      subject.posts_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'is not valid if the posts_counter is less than 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'returns the three most recent posts' do
      user = User.create(name: 'Saluum', photo: 'https://example.com/photo.jpg', bio: 'Hello, I am Saluum.')

      Post.create(title: 'First Post', text: 'This is my first post', author: user)
      Post.create(title: 'Second Post', text: 'This is my second post', author: user)
      post3 = Post.create(title: 'Third Post', text: 'This is my third post', author: user)
      post4 = Post.create(title: 'fourth post', text: 'This is my fourth post', author: user)
      post5 = Post.create(title: 'fifth Post', text: 'This is my fifth post', author: user)

      expected_posts = [post5, post4, post3]

      expect(user.three_most_recent_posts).to eq(expected_posts)
    end
  end
end
