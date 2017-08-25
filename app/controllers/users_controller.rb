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
  end
end
