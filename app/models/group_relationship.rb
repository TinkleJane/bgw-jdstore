class GroupRelationship < ApplicationRecord
  belongs_to :product
  belongs_to :group
end
