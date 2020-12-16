class ProductsController < ApplicationController
  def index
     @pdts = Product.all
  end

  def new
    @p = Product.new
  end

  def create
    p = params[:product]
    @pd = Product.new(
      name: p[:name],
      price: p[:price].to_i
    )
    
    @pd.save
    p @pd.errors.full_messages
    
    redirect_to products_path
  end

  def destroy
    id = params[:id]
    Product.find(id).destroy
    redirect_to products_path
  end
end
