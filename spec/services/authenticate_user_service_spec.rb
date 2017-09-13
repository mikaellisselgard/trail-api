# frozen_string_literal: true

describe AuthenticateUserService do
  subject(:service) { described_class }

  before do
    create(:user, email: 'test@example.com', password: 'secret')
  end

  describe '.call' do
    context 'when authentication is successful' do
      it 'succeeds' do
        expect(service.call('test@example.com', 'secret'))
          .to be_success
      end
    end

    context 'when authentication is not successful' do
      it 'fails' do
        expect(service.call('incorrect_email', 'incorrect_password'))
          .to be_failure
      end
    end
  end
end
