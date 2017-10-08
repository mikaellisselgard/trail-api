# frozen_string_literal: true

class Schema
  attr_accessor :validation

  def initialize(schema)
    @validation = Dry::Validation.Schema(schema)
  end
end
