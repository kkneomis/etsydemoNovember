
#require 'elasticsearch/model'

class Listing < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  validates :name, :author, :course, :condition, presence: true
  validates :price, numericality:{ greater_than: 0}  
  
  belongs_to :user
  has_many :orders
  
  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks
  
 def self.search(query)
   where("name like ?", "%#{query}%")
  end

end

 #Listing.import # for auto sync model with elastic search
    


