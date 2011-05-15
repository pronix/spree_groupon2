class AddColumnsInProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :sex,       :string
    add_column :profiles, :birthday,  :date
    add_column :profiles, :metro,     :string
    
  end

  def self.down
    remove_column :profiles, :sex
    remove_column :profiles, :birthday
    remove_column :profiles, :metro
  end
end


      
