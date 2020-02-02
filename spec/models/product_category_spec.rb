# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  it { expect { create :product_category }.not_to raise_error }
end
