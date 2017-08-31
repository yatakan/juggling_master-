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

  def create
    if env['omniauth.auth'].present?
        # Facebookログイン
        @user  = User.from_omniauth(env['omniauth.auth'])
        result = @user.save(context: :facebook_login)
        fb       = "Facebook"
    else
        # 通常サインアップ
        @user  = User.new(strong_params)
        result = @user.save
        fb       = ""
    end
    if result
        sign_in @user
        flash[:success] = "#{fb}ログインしました。" 
        redirect_to @user
    else
        if fb.present?
            redirect_to auth_failure_path
        else
            render 'new'
        end
    end
  end
end
