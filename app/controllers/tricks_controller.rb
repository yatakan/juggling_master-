class TricksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tricks = Trick.all
    @numbers = (1..13).to_a
  end

  def records
    @trick = Trick.find(params[:trick_id])
    @category = Category.find(params[:category_id])
    @number = params[:number]
    @records = @trick.records.where(user_id: current_user.id).where(number: @number).where(category_id: @category)


    gon.records = []
    gon.date = []

    @records.each do |record|
      gon.records << record[:catch]
      gon.date << record[:date]
    end

    redirect_to tricks_path, notice: "該当するデータがありませんでした" unless gon.records.present?
  end
end
