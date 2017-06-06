class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :photos
  accepts_nested_attributes_for :photos

  has_many :label_relationships
  has_many :labels, through: :label_relationships

  has_many :group_relationships
  has_many :groups, through: :group_relationships
  
  has_many :collection_containers
  has_many :fans, through: :collection_containers, source: :user

  has_many :comments
end
