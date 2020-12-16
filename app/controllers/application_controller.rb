class ApplicationController < ActionController::Base
 private
    def current_cart
        if session[:cart_id]
            cart = Cart.find_by(id: session[:cart_id])
            if cart.nil? then
                cart = Cart.create
                session[:cart_id] = cart.id
            end
        else
            cart = Cart.create
            session[:cart_id] = cart.id
        end
        
        cart
    end
    helper_method :current_cartend

    def getItemCounts
        cart = current_cart
        return cart.cart_items.count
    end
    helper_method :getItemCounts
end
