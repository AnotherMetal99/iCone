class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def destroy
    @like.destroy
    redirect_to post_path(@post)
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

  private
  def find_post
    @post = Post.find(params[:post_id])
  end

end
