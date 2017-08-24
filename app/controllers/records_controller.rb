class RecordsController < ApplicationController
  def index
  end

  def new
    @record = Record.new
    @numbers = (1..13).to_a
  end

  def create
    # @record = Record.where.first_or_initialize(params[:]
    redirect_to root_path
  end

  private
  def record_params
    params.require(:record).permit(:catch, :trick_id, :category_id, :number, :text).merge(user_id: current_user.id, date: Date.today)
  end
end
