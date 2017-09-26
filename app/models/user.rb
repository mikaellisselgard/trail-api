# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :locations

  validates :email, presence: true, uniqueness: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }
end
