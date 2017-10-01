# frozen_string_literal: true

FactoryGirl.define do
  factory :location do
    lat 58.333
    lng 15.333
    user

    before(:create) do |location|
      location.locatable_items <<
        FactoryGirl.build(
          :locatable_item,
          location: location
        )
    end
  end
end
