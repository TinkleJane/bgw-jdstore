class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    flash[:warning] = "成功将 #{@product.title} 从购物车删除!"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.product.quantity >= params[:quantity].to_i
      @cart_item.set_quantity!(params[:quantity].to_i)
      sum = params[:quantity].to_i * @cart_item.product.price
      render :json => { :product_id => params[:id], :cart_item_sum => sum, :cart_sum => current_cart.total_price  }
    else
      render :json => { :message => '数量不足以加入购物车' }
    end
  end

  # private
  #
  # def cart_item_params
  #   params.require(:cart_item).permit(:quantity)
  # end
end
