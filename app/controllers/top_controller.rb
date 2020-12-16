class TopController < ApplicationController
  def main
    @products = Product.all
    @item = CartItem.new
  end
end
