# frozen_string_literal: true

FactoryGirl.define do
  factory :location_with_fish, class: 'Location' do
    lat 58.333
    lng 15.333
    user

    before(:create) do |location|
      location.locatable_items <<
        FactoryGirl.build(
          :locatable_item_fish,
          location: location
        )
    end
  end

  factory :location_with_mushroom, class: 'Location' do
    lat 57.333
    lng 15.111
    user

    before(:create) do |location|
      location.locatable_items <<
        FactoryGirl.build(
          :locatable_item_mushroom,
          location: location
        )
    end
  end
end
