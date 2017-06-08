class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:collect, :discollect]
  before_action :validate_search_key, only: [:search]
  def index
    @products = Product.onsaled.order("position ASC").paginate(:page => params[:page], :per_page => 16 )
  end

  def show
    @product = Product.includes(:photos).includes(:comments).find(params[:id])
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

  def search
    if @query_string.present?
      search_result = Product.onsaled.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 16 )
    else
      @products = Product.onsaled.paginate(:page => params[:page], :per_page => 16 )
    end
  end

  protected
  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")
    if params[:q].present?
      @search_criteria =  {
        title_or_description_cont: @query_string
      }
    end
  end
end
