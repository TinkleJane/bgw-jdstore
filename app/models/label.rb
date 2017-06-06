class Label < ApplicationRecord
  has_many :label_relationships
  has_many :products, through: :label_relationships
end
