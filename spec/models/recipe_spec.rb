# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it { expect { create :recipe }.not_to raise_error }
end
