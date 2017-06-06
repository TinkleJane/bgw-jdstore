class ProductsController < ApplicationController

  before_action :authenticate_user!, only: [:collect, :discollect]
  def index
    @products = Product.all
  end

  def show
    @product = Product.includes(:photos).find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = '你的购物车内已有此物品'
    end
    redirect_to :back
  end

  def collect
    @product = Product.find(params[:id])
    current_user.collect!(@product)
    redirect_to :back
    flash[:notice] = "成功将#{@product.title} 加入收藏"
  end

  def discollect
    @product = Product.find(params[:id])
    current_user.discollect!(@product)
    redirect_to :back
    flash[:notice] = "已经移除对#{@product.title} 的收藏 "
  end
end
