class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :condition
      t.string :course
      t.string :isbn
      t.string :picurl
      t.string :aprice
      t.string :link

      t.timestamps
    end
  end
end
