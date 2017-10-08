# frozen_string_literal: true

require 'spec_helper'

describe Location, type: :model do
  let!(:location) { create(:location_with_fish) }

  describe '.closest_by' do
    it 'should return the closest location for given coordinates' do
      closest_location = Location.closest_by(
        Coordinate.new(58.332, 15.332),
        'fish',
        location.user_id
      )

      expect(closest_location).to eq(location)
    end
  end

  describe '.within_by' do
    it 'should return locations within given distance for given coordinates' do
      locations_within = Location.within_by(
        Area.new(10, Coordinate.new(58.332, 15.332)),
        'fish',
        location.user_id
      )

      expect(locations_within).to include(location)
    end
  end
end
