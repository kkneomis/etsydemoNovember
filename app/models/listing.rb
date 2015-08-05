
#require 'elasticsearch/model'

class Listing < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  
  validates :name, :author, :course, :condition, presence: true
  validates :price, numericality:{ greater_than: 0}  
  
  belongs_to :user
  has_many :orders
  
  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks
  
 def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end

 #Listing.import # for auto sync model with elastic search
    


