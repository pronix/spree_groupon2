class Profile < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  accepts_nested_attributes_for :user
end
