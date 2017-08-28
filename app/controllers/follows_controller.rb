class FollowsController < ApplicationController
  def create
    binding.pry
    Follow.create(follow_id: current_user.id, follower_id: params[:id])
    redirect_to user_path(params[:id])
  end

  def show_follows
    @follows = @current_user.users
  end

  def show_followers
  end
end
