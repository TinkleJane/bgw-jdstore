class WelcomeController < ApplicationController
  def about; end

  def index
    @products = Product.onsaled.where(:is_command => true).take(2)
    @products_show = Product.onsaled.order("position ASC").where(:is_command => false).take(5)
  end
end
