class AddAuthorCouponToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :author_coupon_id, :integer
    add_index :orders, :author_coupon_id
  end

  def self.down
    remove_column :orders, :author_coupon_id
    remove_index :orders, :author_coupon_id
  end
end
