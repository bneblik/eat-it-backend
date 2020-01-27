# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions requests', type: :request do
  let(:url) { '/api/v1/users/sessions.json' }
  let(:headers) { { 'Content-Type' => 'application/json' } }

  subject do
    post url, params: { user: { email: user.email, password: 'password' } }, headers: {}
    response
  end

  context 'with correct params' do
    let(:user) { create(:user, password: 'password', password_confirmation: 'password') }

    it { expect(subject).to have_http_status(200) }
  end

  context 'with incorrect params' do
    let(:user) { create(:user, password: 'password1', password_confirmation: 'password1') }

    it { expect(subject).to have_http_status(401) }
  end
end
