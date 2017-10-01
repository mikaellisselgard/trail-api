# frozen_string_literal: true

require 'spec_helper'

describe LocationsController, type: :controller do
  let!(:fish) { create(:fish) }
  let!(:location) { create(:location) }
  let!(:jwt) { generate_jwt(location.user) }

  before do
    request.headers['Authorization'] = jwt
  end

  describe '#index' do
    it 'should should return a users locations' do
      get :index
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data.size).to eq(1)
    end
  end

  describe '#show' do
    it 'should return provided location' do
      get :show, params: { id: location.id }
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data['lat']).to eq('58.333')
    end
  end

  describe '#create' do
    context 'when params are valid' do
      it 'should return location' do
        post :create, params: {
          location: {
            lat: 54.1234,
            lng: 15.1234
          },
          type: 'fish',
          item_ids: [fish.id]
        }
        data = JSON.parse(response.body)

        expect(response).to have_http_status(200)
        expect(data['lat']).to eq('54.1234')
      end
    end

    context 'when params are invalid' do
      it 'should return location errors' do
        post :create, params: {
          location: {
            lat: 54.1234
          },
          type: 'fish',
          item_ids: [1]
        }
        data = JSON.parse(response.body)

        expect(response).to have_http_status(400)
        expect(data['errors']).to be_present
      end
    end
  end

  describe '#update' do
    context 'when params are valid' do
      let(:attributes) { { lat: 45.1234 } }

      it 'should return location' do
        patch :update, params: {
          id: location.id,
          location: attributes
        }
        data = JSON.parse(response.body)

        expect(response).to have_http_status(200)
        expect(data['lat']).to eq('45.1234')
      end
    end

    context 'when params are invalid' do
      it 'should return location errors' do
        patch :update, params: {
          id: location.id,
          location: { lat: nil }
        }
        data = JSON.parse(response.body)

        expect(response).to have_http_status(400)
        expect(data['errors']).to be_present
      end
    end
  end

  describe '#destroy' do
    it 'should return 204' do
      expect { delete :destroy, params: { id: location.id } }
        .to change { Location.count }.by(-1)
      expect(response).to have_http_status(204)
    end
  end

  describe '#closest' do
    it 'should return closest location' do
      get :closest, params: { lat: 58.332, lng: 15.333, type: 'fish' }
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data['id']).to eq(location.id)
    end
  end

  describe '#within' do
    it 'should return locations within given distance for given coordinates' do
      get :within, params: {
        distance: 10, lat: 58.332, lng: 15.333, type: 'fish'
      }
      data = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(data.first['id']).to eq(location.id)
    end
  end
end
