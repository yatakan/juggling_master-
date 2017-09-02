class ArticleCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @article_comment = ArticleComment.new
    @article = Article.find(params[:article_id])
  end

  def create
    @article_comment = ArticleComment.new(comment_params)
    @article = Article.find(params[:article_id])
    if @article_comment.save
      redirect_to article_path(params[:article_id])
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:article_comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
