class ArticleCommentsController < ApplicationController
  def index
  end

  def new
    @comment = ArticleComment.new
    @article = ArticleComment.find(params[:article_id])
  end

  def create
    Comment.create(comment_params)
    redirect_to article_path(params[:article_id])
  end

  private
  def comment_params
    params.require(:article_comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
