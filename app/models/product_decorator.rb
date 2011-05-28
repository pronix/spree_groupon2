Product.class_eval do

  has_many :conditions, :dependent => :destroy
  has_many :features, :dependent => :destroy
  #has_one :state

  attr_accessible :name, :description, :price, :discount, :available_on, :sku,
    :state_id, :permalink, :conditions, :conditions_attributes, :features, :features_attributes

  validates_presence_of :discount, :state_id, :description,
    :conditions, :features

  accepts_nested_attributes_for :conditions,
    :allow_destroy => true
  accepts_nested_attributes_for :features,
    :allow_destroy => true

end
