class RenameColumnTypeToActionTypeInProducts < ActiveRecord::Migration
  def self.up
    rename_column :products, :type, :action_type
  end

  def self.down
    rename_column :products, :action_type, :type
  end
end
