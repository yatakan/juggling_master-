class TricksController < ApplicationController
  def index
    @tricks = Trick.all
    @numbers = (1..13).to_a
  end

  def show
    ### 技名をクリックしたら飛ぶページ
    @trick = Trick.find(params[:id])
    @category = Category.find(params[:category_id])
    @number = params[:number]
    @name = "#{@number} #{@material} #{@trick.name}"
    @records = @trick.records.where(category_id: @category.id).where(number: @number).order("catch DESC")
    @tricks = Trick.all
    @numbers = (1..13).to_a
  end
end
