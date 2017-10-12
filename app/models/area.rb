# frozen_string_literal: true

class Area
  attr_reader :distance, :coordinates

  def initialize(distance, coordinates)
    @distance = distance
    @coordinates = coordinates
  end
end
