class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:PostsCounter)
  end

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end