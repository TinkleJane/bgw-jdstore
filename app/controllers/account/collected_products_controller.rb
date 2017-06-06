class Account::CollectedProductsController < ApplicationController

  before_action :authenticate_user!

  def collected_products
    @products = current_user.collected_products
 
  end


end
