User.class_eval do

  validates_presence_of :phone, :state_id
  belongs_to :state

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me, :persistence_token, :phone, :state_id, :phone_confirm_key, :phone_confirm

  before_create :set_phone_confirm_key

  def phone_confirm!
    self.update_attributes(:phone_confirm_key => nil, :phone_confirm => true)
  end

  def phone_confirm?
    self.phone_confirm
  end

  protected

  # Ключ подтверждения который будет выслан на мобильный
  def set_phone_confirm_key
    self.phone_confirm_key = rand(9999)
  end

  def password_required?
    false
#    !persisted? || password.present? || password_confirmation.present?
  end

end

