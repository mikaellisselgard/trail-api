# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rspec/rails'
require 'support/factory_girl'
require 'support/database_cleaner'


class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end
