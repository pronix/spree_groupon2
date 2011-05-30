class RemoveNameFieldInConditions < ActiveRecord::Migration
  def self.up
    remove_column :conditions, :name
  end

  def self.down
    add_column :conditions, :name, :string
  end
end
