class DebtsController < ApplicationController

  def index
  	@debts = Debt.all 
  end


  def show
  	@debt = Debt.find(params[:id])
  end

  def destroy
  	@debt = Debt.find(params[:id])
  	@debt.destroy
  	flash[:notice] = "Debt has been cleared"
  	redirect_to debts_path
  end

  def new
  	#dummy page
  	@new_debt = Debt.new 
  end

  def create
  	#real data adding
  	@debt = Debt.create(user_params)

  	if @debt.save 
  		flash[:notice] = "New Debt Ower Added Successfully."
  		redirect_to @debt
  	else 
  		render :action => "new"
  	end
  end

  private

  	def user_params
  		params.require(:debt).permit(:name,:amount)
  	end
end
