class AddColumnInUsersConfirmPhone < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_confirm_key, :string
    add_column :users, :phone_confirm, :boolean, :default => false
  end

  def self.down
    remove_column :users, :phone_confirm_key
    remove_column :users, :phone_confirm
  end
end
