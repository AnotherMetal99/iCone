class CommentsController < ApplicationController
before_action :set_post
before_action :authenticate_user!

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_back(fallback_location: dashboard_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: dashboard_path)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
