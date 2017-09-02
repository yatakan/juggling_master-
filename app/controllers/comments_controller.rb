class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @comment = Comment.new
    @record = Record.find(params[:record_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @record = Record.find(params[:record_id])
    if @comment.save
      redirect_to record_path(params[:record_id])
    else
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, record_id: params[:record_id])
  end
end
