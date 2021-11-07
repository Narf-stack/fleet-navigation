require 'rails_helper'

RSpec.describe Location, type: :model do
  let!(:vehicle) { FactoryBot.create(:vehicle) }
  let!(:location) { FactoryBot.create(:location,latitude: 1.5,longitude: 1.5, 
                                      at:"2021-11-07 13:40:36", vehicle: vehicle) }

  describe 'it is linked to a vehicle' do
    it "belongs to a vehicle" do
      location_association = Location.reflect_on_association(:vehicle)
      expect(location_association.macro).to eq(:belongs_to)
    end

    it "should be destroy when the vehicle it is linked to is destroyed" do
      expect { vehicle.destroy }.to change { Location.count }.by(-1)
    end

    it "should not destroy the vehicle it is linked to once it is destroyed" do
      expect { location.destroy }.to change { Vehicle.count }.by(0)
    end
  end

  describe 'it has an latitude' do
    it 'has no error when the latitude is filed' do
      location.valid?
      expect(vehicle.errors[:latitude].size).to eq(0)
    end
    it 'has one error when the latitude is not filed' do
      location = Location.new(longitude: 1.5, 
        at:"2021-11-07 13:40:36", vehicle: vehicle)

      location.valid?
      expect(location.errors[:latitude].size).to eq(1)
    end
  end

  describe 'it has a longitude' do
    it 'has no error when the longitude is filed' do
      location.valid?
      expect(vehicle.errors[:longitude].size).to eq(0)
    end
    it 'has one error when the longitude is not filed' do
      location = Location.new(latitude: 1.5, 
        at:"2021-11-07 13:40:36", vehicle: vehicle)

      location.valid?
      expect(location.errors[:longitude].size).to eq(1)
    end
  end

  describe 'it has a location time ' do
    it 'has no error when the location time is defined' do
      location.valid?
      expect(vehicle.errors[:at].size).to eq(0)
    end
    it 'has one error when the location time is not defined' do
      location = Location.new(latitude: 1.5,longitude: 1.5, vehicle: vehicle)

      location.valid?
      expect(location.errors[:at].size).to eq(1)
    end
  end

  # it ' has uniques couples of vehicles and date' do
  #    expect(location).to validate_uniqueness_of(:at).scoped_to(:vehicle)
  # end
end
