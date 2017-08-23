class RecordsController < ApplicationController
  def index
  end

  def new
    @record = Record.new
  end

  def create
    Record.create(record_params)
    redirect_to root_path
  end

  private
  def record_params
    params.require(:record).permit(:catch, :trick_id).merge(user_id: current_user.id)
  end
end
