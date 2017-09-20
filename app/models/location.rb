# frozen_string_literal: true

class Location < ApplicationRecord
  belongs_to :user

  has_many :locatable_items
  has_many :fishes,
           through: :locatable_items,
           source: :locatable,
           source_type: 'Fish'

  acts_as_mappable

  validates :lat, presence: true
  validates :lng, presence: true
  validates :locatable_items, presence: true
end
