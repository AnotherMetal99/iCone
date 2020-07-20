# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
    @posts = Post.active
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if user_signed_in?
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to dashboard_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :image)
  end
end
