class RenameColumnRegionIdToStateIdInUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :region_id, :state_id
  end

  def self.down
    rename_column :users, :state_id, :region_id
  end
end
