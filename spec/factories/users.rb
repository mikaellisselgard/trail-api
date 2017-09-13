# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password 'password'
  end
end
