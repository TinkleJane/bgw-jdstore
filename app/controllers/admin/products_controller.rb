class Admin::ProductsController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @photos = @product.photos.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      unless params[:photos].nil?
        params[:photos]['avatar'].each do |a|
          @photo = @product.photos.create(avatar: a)
        end
      end

      redirect_to admin_products_path
    else
      render :new
     end
  end

  def edit
    @product = Product.includes(:photos).find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      unless params[:photos].nil?
        @product.photos.destroy_all # need to destroy old pics first

        params[:photos]['avatar'].each do |a|
          @photo = @product.photos.create(avatar: a)
        end
      end
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :photos)
  end
end
