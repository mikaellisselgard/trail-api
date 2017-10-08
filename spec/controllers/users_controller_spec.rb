# frozen_string_literal: true

require 'spec_helper'

describe UsersController, type: :controller do
  let!(:user) { create(:user) }

  describe '#show' do
    it 'should return provided user' do
      request.headers['Authorization'] = generate_jwt(user)
      get :show, params: { id: user.id }
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data['email']).to be_present
    end
  end

  describe '#create' do
    context 'when params are valid' do
      it 'should return user' do
        post :create, params: {
          name: 'Test User',
          email: 'test@example.com',
          password: 'password'
        }

        data = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(data['email']).to eq('test@example.com')
      end
    end

    context 'when params are invalid' do
      it 'should return user errors' do
        post :create, params: {
          name: 'Test User',
          email: 'test@example.com'
        }

        data = JSON.parse(response.body)
        expect(response).to have_http_status(400)
        expect(data['errors']).to be_present
      end
    end
  end

  describe '#update' do
    context 'when params are valid' do
      it 'should return user' do
        request.headers['Authorization'] = generate_jwt(user)
        patch :update, params: { id: user.id, user: { name: 'New name' } }
        data = JSON.parse(response.body)

        expect(response).to have_http_status(200)
        expect(data['name']).to eq('New name')
      end
    end

    context 'when params are invalid' do
      it 'should return user errors' do
        request.headers['Authorization'] = generate_jwt(user)
        patch :update, params: { id: user.id, user: { email: '' } }
        data = JSON.parse(response.body)

        expect(response).to have_http_status(400)
        expect(data['errors']).to be_present
      end
    end
  end
end
