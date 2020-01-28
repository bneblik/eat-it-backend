# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  describe 'GET #Property' do
    it 'returns http success' do
      get :Property
      expect(response).to have_http_status(:success)
    end
  end
end