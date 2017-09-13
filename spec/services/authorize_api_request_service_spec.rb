# frozen_string_literal: true

require 'spec_helper'

describe AuthorizeAPIRequestService, type: :service do
  subject(:service) { described_class }
  let!(:user) { create(:user) }
  let!(:jwt) { AuthenticateUserService.call(user.email, user.password).result }

  describe '.call' do
    context 'when authorize API request is successful' do
      let(:headers) { { 'Authorization' => jwt } }

      it 'succeeds' do
        expect(service.call(headers)).to be_success
      end
    end

    context 'when authorize API request with invalid token' do
      let(:headers) { { 'Authorization' => 'invalid_token' } }

      it 'fails' do
        expect(service.call(headers)).to be_failure
      end
    end

    context 'when authorize API request with missing token' do
      let(:headers) { { 'Authorization' => '' } }

      it 'fails' do
        expect(service.call(headers)).to be_failure
      end
    end
  end
end
