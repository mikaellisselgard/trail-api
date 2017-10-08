# frozen_string_literal: true

class Locations::WithinSchema < Locations::BaseSchema
  define! do
    required(:distance).filled(:str?)
    required(:lat).filled(:str?)
    required(:lng).filled(:str?)
  end
end
