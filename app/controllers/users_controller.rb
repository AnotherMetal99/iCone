class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile]

  def index
  @posts = Post.where(user_id: current_user.followings.pluck(:id)).order(created_at: :desc)
  @followers = User.where.not(id: current_user.followings)
  @comment = Comment.new
  end

  def profile
    @posts = Post.active
    @posts = @user.posts.active
  end

  private
  def set_user
 @user= User.find_by_username(params[:username])
  end
end
