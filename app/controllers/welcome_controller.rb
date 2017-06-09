class WelcomeController < ApplicationController
  def about; end

  def index
    @products = Product.onsaled.where(:is_command => true).take(2)
  end
end
