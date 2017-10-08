# frozen_string_literal: true

class Locations::UpdateSchema < Dry::Validation::Schema
  define! do
    optional(:lat).filled(:str?)
    optional(:lng).filled(:str?)
    optional(:item_ids).filled(:array?)
    optional(:type).filled(
      :str?, included_in?: Locations::BaseSchema::ACCEPTED_TYPES
    )
  end
end
