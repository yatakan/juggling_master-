class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    ## ルートページです
    @comments = Comment.order('created_at DESC').limit(5)
    @articles = Article.order('created_at DESC').limit(5)
    @records = Record.order('created_at DESC').limit(5)
  end

  def show
    set_record
    @records = [@record]
    @comments = @record.comments
  end

  def new
    @record = Record.new
    set_tricks
  end

  def create
    @trick = Trick.find(params[:trick_id])
    @category = Category.find(params[:category_id])
    @number = params[:number]
    @date = params[:date]
    @record = @trick.records.where(user_id: current_user.id).where(number: @number).where(category_id: @category).where(date: @date).first_or_initialize
    if @record.id
      update_date
      if @record.save
        redirect_to new_record_path, notice: "同じ技は１日１つしかデータを保存できません。上書きしました"
      else
        set_tricks
        render :new
      end
    else
      update_date
      if @record.save
        redirect_to new_record_path, notice: "保存しました！"
      else
        set_tricks
        render :new
      end
    end
  end

  def destroy
    set_record
    @record.destroy
  end

  def about
  end

  def search
    if params[:all] == "show"
      @records = Record.all.includes(:user).page(params[:page]).per(10)
      @number = 3
      set_records_variables
    else
      ### 技名をクリックしたら飛ぶページ
      @trick = Trick.find(params[:trick_id])
      @category = Category.find(params[:category_id])
      @number = params[:number]
      @name = "#{@number} #{@category.material} #{@trick.name}"
      @records = @trick.records.where(category_id: @category.id).where(number: @number).order("catch DESC").includes(:user).page(params[:page]).per(10)
      set_records_variables
    end
  end

  def graph
    @trick = Trick.find(params[:trick_id])
    @category = Category.find(params[:category_id])
    @number = params[:number]
    @user = User.find(params[:user_id])
    @records = @trick.records.where(user_id: @user.id).where(number: @number).where(category_id: @category).limit(30)
    ####ここがうまく動くか試していない###

    @trick_name = "#{@number}#{@category.material}#{@trick.name}"
    gon.trick = "#{@number}#{@category.material}#{@trick.name}"
    gon.nickname = @user.name

    gon.records = []
    gon.date = []

    @records.each do |record|
      gon.records << record[:catch]
      gon.date << record[:date]
    end

    redirect_to tricks_path, notice: "該当するデータがありませんでした" unless gon.records.present?
  end

  private
  def set_record
    @record = Record.find(params[:id])
  end

  def set_tricks
    @tricks = Trick.all
  end

  def update_date
    @record.trick_id = params[:trick_id]
    @record.category_id = params[:category_id]
    @record.user_id = current_user.id
    @record.catch = params[:catch].tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
    @record.number = params[:number]
    @record.text = params[:text]
    @record.date = params[:date]
  end

  def set_records_variables
    @tricks = Trick.all
    @numbers = (1..13).to_a
  end
end
