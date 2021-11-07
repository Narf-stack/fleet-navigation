require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'it can be created' do
    it 'has no error on creation' do
      vehicule = FactoryBot.create(:vehicle) 
      vehicule.valid?
      expect(vehicule.errors.size).to eq(0)
    end
  end
end