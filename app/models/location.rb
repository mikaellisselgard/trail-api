# frozen_string_literal: true

class Location < ApplicationRecord
  ACCEPTED_TYPES = %w[fish mushroom].freeze

  belongs_to :user

  has_many :locatable_items, dependent: :delete_all
  has_many :fishes,
           through: :locatable_items,
           source: :locatable,
           source_type: 'Fish'

  acts_as_mappable default_units: :kms

  validates :lat, presence: true
  validates :lng, presence: true
  validates :locatable_items, presence: true

  attr_accessor :distance

  def self.closest_by(coordinates, type, user_id)
    closest(origin: coordinates)
      .where(user_id: user_id)
      .joins(:locatable_items)
      .find_by(
        'locatable_items.locatable_type = ?',
        type.classify
      )
      .calculate_distance_from(coordinates)
  end

  def self.within_by(distance, coordinates, type, user_id)
    within(distance, origin: coordinates)
      .distinct
      .where(user_id: user_id)
      .joins(:locatable_items)
      .where(
        'locatable_items.locatable_type = ?',
        type.classify
      )
      .map { |l| l.calculate_distance_from(coordinates) }
      .sort_by(&:distance)
  end

  def calculate_distance_from(coordinates)
    self.distance = distance_from(coordinates, units: :kms)
    self
  end
end
