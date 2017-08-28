class RecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    ## ルートページです
    @comments = Comment.order('created_at DESC').limit(5)
    @articles = Article.order('created_at DESC').limit(5)
    @records = Record.order('created_at DESC').limit(5)
  end

  def show
    @record = Record.find(params[:id])
    @comments = @record.comments
  end

  def new
    @tricks = Trick.all
    @numbers = (1..13).to_a
  end

  def create
    @trick = Trick.find(params[:trick_id])
    @category = Category.find(params[:category_id])
    @number = params[:number]
    @record = @trick.records.where(user_id: current_user.id).where(number: @number).where(category_id: @category).where(date: Date.today).first_or_initialize
    if @record.id
      update_date
      redirect_to new_record_path, notice: "同じ技は１日１つしかデータを保存できません。上書きしました"
    else
      update_date
      redirect_to new_record_path, notice: "保存しました！"
    end
  end

  def about
  end

  private
  def update_date
    @record.trick_id = params[:trick_id]
    @record.category_id = params[:category_id]
    @record.user_id = current_user.id
    @record.catch = params[:catch]
    @record.number = params[:number]
    @record.text = params[:text]
    @record.date = Date.today
    @record.save
  end
end
