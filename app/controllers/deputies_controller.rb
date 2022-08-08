class DeputiesController < ApplicationController
  respond_to :json

  def index
    @deputies = Deputy.all.order(:name)

    render status: :ok
  end

  def show
    @deputy = Deputy.find(params[:id])

    render status: :ok
  end

  def expenses
    @deputy = Deputy.find(params[:id])
    @expenses = Expense.where(deputy: @deputy).order(net_value: :desc).includes([:provider])
  end
end
