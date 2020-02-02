# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { expect { create :comment }.not_to raise_error }
end
