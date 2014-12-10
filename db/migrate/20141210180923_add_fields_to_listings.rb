class AddFieldsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :isbn, :string
    add_column :listings, :picurl, :string
    add_column :listings, :aprice, :string
    add_column :listings, :link, :string
    add_column :listings, :is_active, :boolean
  end

end
