User.class_eval do

  validates_presence_of :phone, :state_id
  belongs_to :state

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me, :persistence_token, :phone, :state_id

  protected
  def password_required?
    false
#    !persisted? || password.present? || password_confirmation.present?
  end

end

