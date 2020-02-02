# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MealCategory, type: :model do
  it { expect { create :meal_category }.not_to raise_error }
end
