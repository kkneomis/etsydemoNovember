class CreateEsteems < ActiveRecord::Migration
  def change
    create_table :esteems do |t|
      t.string :name
      t.string :title
      t.string :condition
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
