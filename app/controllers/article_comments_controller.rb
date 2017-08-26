class ArticleCommentsController < ApplicationController
  def index
  end

  def new
    @article_comment = ArticleComment.new
    @article = Article.find(params[:article_id])
  end

  def create
    @article_comment = ArticleComment.new(comment_params)
    @article_comment.save
    redirect_to article_path(params[:article_id])
  end

  private
  def comment_params
    params.require(:article_comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end