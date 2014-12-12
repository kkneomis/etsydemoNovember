
require 'iconv'
require 'elasticsearch/model'

class Listing < ActiveRecord::Base
    require 'csv'
  
 def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
        
      listing_hash = row.to_hash # exclude the price field
      listing = Listing.where(name: listing_hash["name"])
      
      if listing.count == 1
        listing.first.update_attributes(listing_hash)
      else
        Listing.create!(listing_hash)
      end
    end 
  end #end self.import
  
  
  mount_uploader :image, ImageUploader
  
  validates :name, :author, :course, :condition, presence: true
  validates :price, numericality:{ greater_than: 0}
  
  
  
  belongs_to :user
  has_many :orders
  

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  

end



    


