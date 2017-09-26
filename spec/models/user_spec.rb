# frozen_string_literal: true

require 'spec_helper'

describe User, type: :model do
  let!(:user) { create(:user) }
  describe 'validations' do
    it 'should validate valid email' do
      expect(user).to be_valid
      user.email = 'invalid.email'
      expect(user).to_not be_valid
    end
  end
end
