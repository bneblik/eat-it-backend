# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fridge, type: :model do
  it { expect { create :fridge }.not_to raise_error }
end
