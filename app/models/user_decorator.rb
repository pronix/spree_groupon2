User.class_eval do

  validates_presence_of :phone, :state_id
  belongs_to :state

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :persistence_token, :phone, :state_id

end

