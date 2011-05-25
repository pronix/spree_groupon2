class AddCouponFieldsToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :state_id, :integer
    add_column :products, :type, :integer
    add_column :products, :discount, :integer
  end

  def self.down
    remove_column :products, :discount
    remove_column :products, :type
    remove_column :products, :state_id
  end
end
