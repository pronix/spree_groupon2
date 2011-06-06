class AddBonusesToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :bonuses, :integer, :default=>0
  end

  def self.down
    remove_column :profiles, :bonuses
  end
end
