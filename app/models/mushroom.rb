# frozen_string_literal: true

class Mushroom < ApplicationRecord
  SPECIES = %w[CHANTARELLE TRUFFLE AGARIC].freeze

  has_many :locatable_items, as: :locatable
  has_many :locations, through: :locatable_items

  validates :species, inclusion: SPECIES
end
