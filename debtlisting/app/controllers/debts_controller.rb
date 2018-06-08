class DebtsController < ApplicationController

  def index
  	@debts = Debt.all
  end
  def show
  	@debt = Debt.find(params[:id])
  end
end
