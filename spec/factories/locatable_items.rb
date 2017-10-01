# frozen_string_literal: true

FactoryGirl.define do
  factory :locatable_item do
    association :locatable, factory: :fish
    locatable_type 'Fish'
    location
  end
end
