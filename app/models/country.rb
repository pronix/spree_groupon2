class Country < ActiveRecord::Base
  has_many :states

  has_one :zone_member, :as => :zoneable
  has_one :zone, :through => :zone_member

  has_many :regions

  validates :name, :iso_name, :presence => true

  def <=>(other)
    name <=> other.name
  end

  def to_s
    name
  end
end
