# frozen_string_literal: true

require 'rails_helper'

describe Coordinate, type: :model do
  describe '#to_a' do
    it 'should return an array with lat and lng' do
      coordinate = Coordinate.new(55.123, 15.123)
      expect(coordinate.to_a).to eq([55.123, 15.123])
    end
  end
end
