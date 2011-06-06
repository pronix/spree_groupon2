class Comment < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates_presence_of :description, :user_id, :product_id

  scope :confirmed, where("comments.confirmed = ?", true)
  scope :unconfirmed, where("comments.confirmed = ?", false)

end
