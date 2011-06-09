class AddPresentEmailToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :present_email, :string
  end

  def self.down
    remove_column :orders, :present_email
  end
end
