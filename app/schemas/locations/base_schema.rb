# frozen_string_literal: true

class Locations::BaseSchema < Dry::Validation::Schema
  ACCEPTED_TYPES = %w[fish mushroom].freeze

  define! do
    required(:lat).filled(:float?)
    required(:lng).filled(:float?)
    required(:type).filled(:str?, included_in?: ACCEPTED_TYPES)
  end
end
