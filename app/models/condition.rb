class Condition < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :product_id
end

