# frozen_string_literal: true

class Area
  attr_accessor :distance, :coordinates

  def initialize(distance, coordinates)
    @distance = distance
    @coordinates = coordinates
  end
end
