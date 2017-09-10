class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    set_user
    @records = @user.records.includes(:trick).limit(15)
    @articles = @user.articles.includes(:user).limit(15)
    @catches = @user.catch_sum(@records)
  end

  def following
    set_user
    @title = "フォローしている人"
    @users = @user.following
    render 'show_follow'
  end

  def followers
    set_user
    @title = "フォローされている人"
    @users = @user.followers
    render 'show_follow'
  end

  def create
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
