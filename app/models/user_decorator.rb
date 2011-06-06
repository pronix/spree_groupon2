# -*- coding: utf-8 -*-
User.class_eval do

  devise :confirmable, :database_authenticatable, :token_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :encryptable, :encryptor => "authlogic_sha512"

  # TODO: fix validation duplication of email
  validates_presence_of :phone, :state_id

  #validates_uniqueness_of :phone

  belongs_to :state
  has_one :profile
  has_many :comments
  has_many :deposit_payments
  accepts_nested_attributes_for :profile

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :persistence_token, :phone, :state_id, :phone_confirm_key, :phone_confirm

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

  # Генерация и сохранение нового пароля
  def generate_new_password
    new_password = ActiveSupport::SecureRandom.hex(4)
    self.reset_password!(new_password, new_password)
  end

  # Отправка нового кода подтверждения на мобильный
  def send_new_mobile_code
    cfg = YAML.load_file("config/sms_gateway.yml")
    gw = ActiveSmsgate::Gateway.gateway('qtelecom').new(:login => cfg["login"], :password => cfg["password"], :ssl=>cfg["ssl"])
    gw.deliver_sms(:phones=>self.phone, :message=>"#{I18n.t("sms.confirmation_text")} #{phone_confirm_key}")
    logger.info("Confirmation code send by email to number '#{self.phone}'")
  end


  protected

  # Ключ подтверждения который будет выслан на мобильный
  def set_phone_confirm_key
    self.phone_confirm_key = rand(9999)
    send_new_mobile_code
  end

  def password_required?
    false
#    !persisted? || password.present? || password_confirmation.present?
  end

end
