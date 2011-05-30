Product.class_eval do

  has_many :conditions, :dependent => :destroy
  has_many :features, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  attr_accessible :name, :description, :price, :discount, :available_on, :sku, :on_hand, :action_type,
    :state_id, :permalink, :conditions, :conditions_attributes, :features, :features_attributes

  validates_presence_of :discount, :state_id, :description, :on_hand, :action_type
  validates_numericality_of :on_hand, :only_integer => true, :greater_than => 0,
    :message => :must_be_greater_than_zero

  validate :presence_of_conditions
  validate :presence_of_features

  accepts_nested_attributes_for :conditions,
    :allow_destroy => true
  accepts_nested_attributes_for :features,
    :allow_destroy => true

  def self.find_all_in_state(state_abbr)
    state = State.find_by_abbr(state_abbr)
    self.find_all_by_state_id(state.id)
  end

  private
  def before_create
    self.available_on=Time.zone.now.to_s(:db)
  end

  def presence_of_conditions
    if conditions.empty? or conditions.all? {|condition| condition.marked_for_destruction? }
      errors[:base] << I18n.t(:must_have_at_least_one_condition)
    end
  end

  def presence_of_features
    if features.empty? or features.all? {|feature| feature.marked_for_destruction? }
      errors[:base] << I18n.t(:must_have_at_least_one_feature)
    end
  end

end
