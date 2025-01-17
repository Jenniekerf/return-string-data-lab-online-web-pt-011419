class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    #binding.pry
    @product.save
    redirect_to products_path
  end

   def description
     @product = Product.find(params[:id])
     render plain: @product.description
   end

   def inventory
     @product = Product.find(params[:id])
     render plain: @product.inventory > 0 ? true : false
   end

  def body
    @product = Product.find(params[:id])
    #binding.pry
    render plain: @product.description
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end


end
