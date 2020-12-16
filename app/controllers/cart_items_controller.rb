class CartItemsController < ApplicationController
  def create
    items = params[:cart_item]
    pid = items[:product_id]
    qty = items[:qty].to_i
    
    if qty <= 0 then
      redirect_to top_main_path
    else
    
      cart = current_cart
      cart_i =  CartItem.new(
        qty: qty,
        product_id: pid
      )
      
      cart.cart_items << cart_i
      
      redirect_to top_main_path
    end
  end

  def destroy
    id = params[:id]
    current_cart.cart_items.find(id).destroy
    
    redirect_to cart_path
  end
end
