# frozen_string_literal: true

class Coordinate
  attr_reader :lat, :lng

  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def to_a
    [lat, lng]
  end
end
