class LabelRelationship < ApplicationRecord
  belongs_to :label
  belongs_to :product
end
