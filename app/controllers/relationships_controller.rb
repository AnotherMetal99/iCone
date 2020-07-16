class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:create,:destroy]

  def user_follower
  @followers = User.where(id: current_user.followers)
  end

  def user_following
  @followings = User.where(id: current_user.followings)
 end

  def create
   current_user.follow(@user)
   redirect_to profile_path(@user.username)
  end

  def destroy
   current_user.unfollow(@user)
   redirect_to profile_path(@user.username)
  end

  private
  def set_user
      @user = User.find(params[:user_id])
  end
end
