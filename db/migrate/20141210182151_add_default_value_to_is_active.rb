class AddDefaultValueToIsActive < ActiveRecord::Migration
  def change
  end
  
  def up
    change_column :listings, :is_active, :boolean, :default => true
  end

    def down
      change_column :listings, :is_active, :boolean, :default => nil
    end
  
end
