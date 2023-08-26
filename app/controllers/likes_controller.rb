class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = current_user.likes.build(post: @post)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Post liked!'
    else
      redirect_to user_post_path(@user, @post), alert: 'not able to like this post.'
    end
  end

  def like
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])

    if current_user.likes.where(post: @post).exists?
      redirect_to user_post_path(@user, @post), alert: 'you liked this post.'
    else
      @post.increment!(:likes_counter)
      redirect_to user_post_path(@user, @post), notice: 'successcfull!'
    end
  end
end
