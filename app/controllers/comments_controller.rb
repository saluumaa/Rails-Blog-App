class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(post: @post, text: comment_params['text'])
    @comment.save

    redirect_to user_posts_path(@user, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
