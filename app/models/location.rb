class Location < ApplicationRecord
  belongs_to :vehicle
  validates :latitude, :longitude, :at, :vehicle, presence: true
  validates_uniqueness_of :vehicle_id, :scope => [:at]

end
