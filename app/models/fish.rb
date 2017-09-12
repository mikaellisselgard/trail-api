# frozen_string_literal: true

class Fish < ApplicationRecord
  has_many :locatable_items, as: :locatable
  has_many :locations, through: :locatable_items
end
