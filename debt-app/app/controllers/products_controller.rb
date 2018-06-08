class ProductsController < ApplicationController

  def index
  	@products = Product.all
  end
  
  def show
  	@product = Product.find( params[:id] )
  end 
  
  def search
	  @products = Product.all
	  if params[:search]
	    @products = Product.search(params[:search]).order("created_at DESC")
	  else
	    @products = Product.all.order("created_at DESC")
	  end
  end	
	  
  def destroy 
  	@product = Product.find(params[:id])
  	@product.destroy
  	flash[:notice] = "Product was successfully deleted."
  	redirect_to products_path
  end
  
  
  def new
  	@product = Product.new
  end
  
  def create
  	@product = Product.new(params.require(:product).permit(:name, :description, :cost, :stock))
  	if @product.save
  		flash[:notice] = "Product has been successfully created."
  		redirect_to @product
  	else
  		render :action => "new"
  	end
  end
  
  
  def edit
  	@product = Product.find(params[:id])
  end
  
  def update 
  	@product = Product.find(params[:id])
  	if @product.update_attributes(params.require(:product)
  	.permit(:name, :description, :cost, :stock))
  		redirect_to @product, notice: "Product was successfully updated."
  		
  	else
  		render action: "edit"
  	end
  end
  
end
