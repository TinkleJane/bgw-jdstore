class Group < ApplicationRecord
  has_many :group_relationships
  has_many :groups, through: :group_relationships
end
