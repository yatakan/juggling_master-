class ArticlesLikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.articles_likes.new(article_id: @article.id)
    like.save
    redirect_to article_path(@article)
  end

  def unlike
    like = current_user.articles_likes.find_by(article_id: @article.id)
    like.destroy
    redirect_to article_path(@article)
  end

  private

  def set_variables
    @article = Article.find(params[:article_id])
    @id_name = "#like-link-#{@article.id}"
    @id_heart = "#heart-#{@article.id}"
  end
end
