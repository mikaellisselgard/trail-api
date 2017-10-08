# frozen_string_literal: true

class Users::BaseSchema < Dry::Validation::Schema
  define! do
    required(:email).filled?(:str?)
    required(:password).filled?(:str?)
  end
end
