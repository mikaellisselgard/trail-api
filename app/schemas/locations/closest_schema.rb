# frozen_string_literal: true

class Locations::ClosestSchema < Locations::BaseSchema
  define! do
    required(:lat).filled(:str?)
    required(:lng).filled(:str?)
  end
end
