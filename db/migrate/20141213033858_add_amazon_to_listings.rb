class AddAmazonToListings < ActiveRecord::Migration
  def change
    add_column :listings, :amazon, :boolean
  end
end
