class CreateConditions < ActiveRecord::Migration
  def self.up
    create_table :conditions do |t|
      t.integer :product_id
      t.string :name
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :conditions
  end
end
