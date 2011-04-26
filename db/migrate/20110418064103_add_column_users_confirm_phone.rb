class AddColumnUsersConfirmPhone < ActiveRecord::Migration
  def self.up
    add_column :users, :confirm_phone_at, :datetime
  end

  def self.down
    remove_column :users, :confirm_phone_at
  end
end
