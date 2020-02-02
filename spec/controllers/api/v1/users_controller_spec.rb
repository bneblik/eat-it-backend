# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users request', type: :request do
  let!(:user) { FactoryBot.create(:user) }

  describe 'GET #show' do
    before do
      get url, headers: define_jwt_headers(user)
    end

    subject { JSON.parse(response.body) }

    let(:url) { "/api/v1/users/#{user.id}.json" }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns requested meal' do
      expect(subject['data']['id'].to_i).to eq(user.id)
    end
  end

  describe 'PUT #update' do
    subject do
      put url, headers: define_jwt_headers(user)
      response
    end

    let(:url) { "/api/v1/users/#{user.id}.json" }
    let(:params) do
      {
        name: 'Name'
      }
    end

    it 'returns http success' do
      expect(subject).to have_http_status(:success)
    end

    it 'update existing meal' do
      expect(User.count).to eq(1)
    end
  end

  describe 'DELETE #destroy' do
    subject do
      delete url, headers: define_jwt_headers(user)
      response
    end

    let(:url) { "/api/v1/users/#{user.id}.json" }

    it 'delete user' do
      expect { subject }.to change { User.count }.from(1).to(0)
    end
  end
end
