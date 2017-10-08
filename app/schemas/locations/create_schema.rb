# frozen_string_literal: true

class Locations::CreateSchema < Locations::BaseSchema
  define! do
    required(:item_ids).filled(:array?)
  end
end
