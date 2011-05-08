Product.class_eval do

  has_many :conditions, :dependent => :destroy
  has_many :features, :dependent => :destroy

  attr_accessible :state_id, :conditions_attributes, :features_attributes

  accepts_nested_attributes_for :conditions, :features, :allow_destroy => true
end
