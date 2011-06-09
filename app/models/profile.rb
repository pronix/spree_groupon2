class Profile < ActiveRecord::Base
  SUBSCRIPTION_DAILY = "daily"
  SUBSCRIPTION_NEVER = "never"

  belongs_to :user
  validates_presence_of :user_id
  accepts_nested_attributes_for :user
  def mailer_daily?
    Profile::SUBSCRIPTION_DAILY == subscription
  end
end
