class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  has_many :orders
  has_many :comments
  def display_name
    self.email.split("@").first
  end

  has_many :collection_containers
  has_many :collected_products, through: :collection_containers, source: :product

  def collect!(product)
    collected_products << product
  end

  def discollect!(product)
    collected_products.delete(product)
  end

end
