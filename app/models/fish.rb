# frozen_string_literal: true

class Fish < ApplicationRecord
  SPECIES = %w[PIKE PERCH ZANDER].freeze

  has_many :locatable_items, as: :locatable
  has_many :locations, through: :locatable_items

  validates :species, inclusion: SPECIES
end
