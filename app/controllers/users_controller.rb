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
  end

  def following
    @title = "フォローしている人"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "フォローされている人"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
