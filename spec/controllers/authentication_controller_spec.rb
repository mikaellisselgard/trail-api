# frozen_string_literal: true

require 'spec_helper'

describe AuthenticationController, type: :controller do
  describe '#authenticate' do
    context 'with valid credentials' do
      let(:user) { create(:user) }
      it 'returns a JWT token' do
        post :authenticate, params: {
          email: user.email,
          password: user.password
        }

        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['token']).to be_present
      end
    end

    context 'with invalid credentials' do
      it 'returns 401' do
        post :authenticate, params: {
          email: 'test@example.com',
          password: 'incorrect'
        }

        expect(response).to have_http_status(401)
      end
    end
  end
end
