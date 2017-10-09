# frozen_string_literal: true

require 'rails_helper'

describe AuthenticateUserService, type: :service do
  subject(:service) { described_class }

  before do
    create(:user, email: 'test@example.com', password: 'secret')
  end

  describe '#perform' do
    context 'when authentication is successful' do
      it 'succeeds' do
        auth_service = service.new('test@example.com', 'secret')
        expect(auth_service.perform).not_to be false
      end
    end

    context 'when authentication is not successful' do
      it 'fails' do
        auth_service = service.new('incorrect_email', 'incorrect_password')
        expect(auth_service.perform).to be false
      end
    end
  end
end
