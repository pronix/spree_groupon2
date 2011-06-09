class AddSubscriptionToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :subscription, :string, :default => "daily"
  end

  def self.down
    remove_column :profiles, :subscription
  end
end
