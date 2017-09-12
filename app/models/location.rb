# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :locatable_items
  has_many :fishes,
           through: :locatable_items,
           source: :locatable,
           source_type: 'Fish'

  acts_as_mappable
end
