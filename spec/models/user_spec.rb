# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { expect { create :user }.not_to raise_error }
end
