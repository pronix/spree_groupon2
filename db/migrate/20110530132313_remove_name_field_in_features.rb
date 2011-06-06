class RemoveNameFieldInFeatures < ActiveRecord::Migration
  def self.up
    remove_column :features, :name
  end

  def self.down
    add_column :features, :name, :string
  end
end
