class Admin::ProductsController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required
  def index
    @products = Product.all.order("position ASC")
  end

  def new
    @product = Product.new
    # @photos = @product.photos.build
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

  def move_up
    @product = Product.find(params[:id])
    @product.move_higher
    redirect_to :back
  end

  def move_down
    @product = Product.find(params[:id])
    @product.move_lower
    redirect_to :back
  end

  def publish
    @product = Product.find(params[:id])
    @product.publish!
    redirect_to :back
  end

  def hide
    @product = Product.find(params[:id])
    @product.hide!
    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :photos, :is_command, :is_hidden, :color, label_ids: [], location_attributes: [:id, :name, :_destroy], group_ids: [])
  end
end
