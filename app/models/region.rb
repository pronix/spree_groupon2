class Region < ActiveRecord::Base
  validates_presence_of :name, :country_id
  belongs_to :country
end
