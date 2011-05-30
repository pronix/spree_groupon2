class AddFeaturedAvailableTillFieldsToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :available_till, :datetime
    add_column :products, :featured, :boolean
  end

  def self.down
    remove_column :products, :featured
    remove_column :products, :available_till
  end
end
