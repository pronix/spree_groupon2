User.class_eval do

  validates_presence_of :phone, :region_id
  belongs_to :region

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :persistence_token, :phone, :region_id

end

