class Profile < ActiveRecord::Base
  SUBSCRIPTION_DAILY = "daily"
  SUBSCRIPTION_NEVER = "never"

  scope :daily_subscription, where( :subscription => Profile::SUBSCRIPTION_DAILY )

  belongs_to :user
  validates_presence_of :user_id
  accepts_nested_attributes_for :user
  def mailer_daily?
    Profile::SUBSCRIPTION_DAILY == subscription
  end
end
