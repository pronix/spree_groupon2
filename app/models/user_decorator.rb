User.class_eval do

  devise :confirmable, :database_authenticatable, :token_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :encryptable, :encryptor => "authlogic_sha512" 

  validates_presence_of :phone, :state_id
  belongs_to :state
  has_one :profile

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me, :persistence_token, :phone, :state_id, :phone_confirm_key, :phone_confirm

  before_create :set_phone_confirm_key
  after_save :create_user_profile

  def create_user_profile
    Profile.new(:balance => 0, :user_id => self.id).save(:validate => false)
  end

  def phone_confirm!
    self.update_attributes(:phone_confirm_key => nil, :phone_confirm => true)
  end

  def phone_confirm?
    self.phone_confirm
  end

  # Отправка нового кода подтверждения на мобильный
  def send_new_mobile_code!
    self.update_attribute(:phone_confirm_key, rand(9999))
    # Тут должно отправится новое смс с новым кодом на мобильный пользователя
    
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

