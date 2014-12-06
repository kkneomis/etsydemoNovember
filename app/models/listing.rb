require 'elasticsearch/model'

class Listing < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  
  validates :name, :author, :course, :condition, presence: true
  validates :price, numericality:{ greater_than: 0}
  
  validates_presence_of :image
  
  belongs_to :user
  has_many :orders
  

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  end

Listing.import # for auto sync model with elastic search
