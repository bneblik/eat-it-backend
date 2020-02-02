# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { expect { create :product }.not_to raise_error }
end
