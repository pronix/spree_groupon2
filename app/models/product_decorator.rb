Product.class_eval do

  has_many :conditions, :dependent => :destroy
  has_many :features, :dependent => :destroy

  attr_accessible :name, :description, :price, :discount, :available_on, :sku,
    :state_id, :permalink, :conditions, :conditions_attributes, :features, :features_attributes

  validates_presence_of :discount, :state_id, :description

  validate :presence_of_features
  validate :presence_of_conditions

  accepts_nested_attributes_for :conditions,
    :allow_destroy => true
  accepts_nested_attributes_for :features,
    :allow_destroy => true

  private

  def presence_of_conditions
    if conditions.empty? or conditions.all? {|condition| condition.marked_for_destruction? }
      errors[:base] << :must_have_at_least_one_condition
    end
  end

  def presence_of_features
    if features.empty? or features.all? {|feature| feature.marked_for_destruction? }
      errors[:base] << :must_have_at_least_one_feature
    end
  end

end
