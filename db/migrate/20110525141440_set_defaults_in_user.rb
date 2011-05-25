class SetDefaultsInUser < ActiveRecord::Migration
  def self.up
    change_column :users, :state_id, :integer, :default => 1
    change_column :users, :phone, :string, :default => 0
  end

  def self.down
    change_column :users, :state_id, :default => null
    change_column :users, :phone, :default => null
  end
end
