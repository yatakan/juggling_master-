class ArticlesController < ApplicationController
  def index
  end

  def show
    @article = Article.find(params[:id])
    @article_comments = @article.article_comments
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :text).merge(user_id: current_user.id)
  end
end
