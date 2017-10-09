# frozen_string_literal: true

require 'rails_helper'

describe Area, type: :model do
  describe 'coordinates' do
    it 'should return a new Coordinate object' do
      area = Area.new(5, Coordinate.new(55.123, 15.123))
      expect(area.coordinates).to be_an_instance_of(Coordinate)
    end
  end
end
