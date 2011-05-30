class AddFieldsToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :confirmed, :boolean, :default => false
  end

  def self.down
    remove_column :comments, :confirmed
  end
end
