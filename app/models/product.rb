class Product < ActiveRecord::Base
  require 'csv'
  
  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
        
      product_hash = row.to_hash # exclude the price field
      product = Product.where(id: product_hash["id"])
      
      if product.count == 1
        product.first.update_attributes(product_hash)
      else
        Product.create!(product_hash)
      end
    end 
  end #end self.import
  
end#end class