class Listing < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  validates :name, :description, :course, :condition, presence: true
  validates :price, numericality:{ greater_than: 0}
  
  validates_presence_of :image
end
