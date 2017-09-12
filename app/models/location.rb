# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :locatables

  acts_as_mappable
end
