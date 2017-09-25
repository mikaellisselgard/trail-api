# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    name 'Test User'
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'password'
  end
end
