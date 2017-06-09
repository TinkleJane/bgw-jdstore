class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  acts_as_list

  has_many :photos
  accepts_nested_attributes_for :photos

  has_many :label_relationships
  has_many :labels, through: :label_relationships

  has_many :group_relationships
  has_many :groups, through: :group_relationships

  has_many :collection_containers
  has_many :fans, through: :collection_containers, source: :user

  has_many :comments

  scope :onsaled, -> { where(is_hidden: false) }

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
