class UsersController < ApplicationController
  def index
    @users = User.all.limit(15)
  end

  def show
    @user = User.find(params[:id])
    @records = @user.records.includes(:trick)
    @catches = 0
    @records.each do |record|
      @catches += record.catch
    end
    @articles = @user.articles
    @follows = current_user.active_follow.follower
    binding.pry
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
end
