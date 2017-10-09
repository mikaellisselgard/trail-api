# frozen_string_literal: true

require 'rails_helper'

describe AuthorizeAPIRequestService, type: :service do
  subject(:service) { described_class }
  let!(:user) { create(:user) }
  let!(:jwt) { generate_jwt(user) }

  describe '#perform' do
    context 'when authorize API request is successful' do
      let(:headers) { { 'Authorization' => jwt } }

      it 'succeeds' do
        expect(service.new(headers).perform).to be_instance_of(User)
      end
    end

    context 'when authorize API request fails' do
      let(:headers) { { 'Authorization' => 'invalid_token' } }

      it 'fails' do
        expect(service.new(headers).perform).to be false
      end
    end
  end
end
