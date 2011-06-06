class CreateDepositPayments < ActiveRecord::Migration
  def self.up
    create_table :deposit_payments do |t|
      t.column :user_id, :integer
      t.column :ammount, :float
      t.column :gateway_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :deposit_payments
  end
end
