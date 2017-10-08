# frozen_string_literal: true

class Users::UpdateSchema < Dry::Validation::Schema
  define! do
    optional(:email).filled(:str?)
    optional(:password).filled(:str?)
  end
end
