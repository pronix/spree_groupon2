class AddFirsnameAndLastnameInProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :firstname, :string
    add_column :profiles, :lastname,  :string
    
  end

  def self.down
    remove_column :profiles, :firstname
    remove_column :profiles, :lastname
  end
end


      
