# frozen_string_literal: true

class LocatableItem < ApplicationRecord
  belongs_to :location
  belongs_to :locatable, polymorphic: true

  acts_as_mappable
end
