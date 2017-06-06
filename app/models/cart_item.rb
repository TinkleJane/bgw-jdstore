class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def set_quantity!(quantity)
    update_columns(quantity: quantity)
  end
end
