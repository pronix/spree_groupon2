class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.integer :product_id
      t.string :name
      t.text :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
