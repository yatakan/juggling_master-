class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
    @record = Record.find(params[:record_id])
  end

  def create
    Comment.create(comment_params)
    redirect_to record_path(params[:record_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, record_id: params[:record_id])
  end
end
