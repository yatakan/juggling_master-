class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_valuables, if: :user_signed_in?

  def after_sign_out_path_for(resource)
    root_path
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :club, :material, :text])
  end

  def set_valuables
    @notices = []

    @articles = current_user.articles
    @articles.each do |article|
      @comments = article.article_comments
      if @comments.present?
        @comments.each do |comment|
          @notices << comment
        end
      end
    end

    @records = current_user.records
    @records.each do |record|
      @comments = record.comments
      if @comments.present?
        @comments.each do |comment|
          @notices << comment
        end
      end
    end

    @notices = @notices.sort { |a, b| b[:created_at] <=> a[:created_at] }
  end
end
