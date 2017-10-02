# frozen_string_literal: true

FactoryGirl.define do
  factory :locatable_item_fish, class: 'LocatableItem' do
    association :locatable, factory: :fish
    locatable_type 'Fish'
  end

  factory :locatable_item_mushroom, class: 'LocatableItem' do
    association :locatable, factory: :mushroom
    locatable_type 'Mushroom'
  end
end
