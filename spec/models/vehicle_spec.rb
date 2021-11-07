require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  let!(:vehicle) { FactoryBot.create(:vehicle) }
  describe 'it can be created' do
    it 'has no error on creation' do
      vehicle.valid?
      expect(vehicle.errors.size).to eq(0)
    end
  end

  describe 'it has locations' do
    it "is able to have many locations" do
      vehicle_association = Vehicle.reflect_on_association(:locations)
      expect(vehicle_association.macro).to eq(:has_many)
    end

    it "should be deleting its locations once destroyed" do
      location = FactoryBot.create(:location,latitude: 1.5,longitude: 1.5, 
        at:"2021-11-07 13:40:36", vehicle: vehicle)

      expect { vehicle.destroy }.to change { Location.count }.by(-1)
    end
  end
end