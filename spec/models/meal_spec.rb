# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Meal, type: :model do
  it { expect { create :meal }.not_to raise_error }
end
