class AddAuthorToListings < ActiveRecord::Migration
  def change
    add_column :listings, :author, :string
  end
end
