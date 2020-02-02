# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShoppingList, type: :model do
  it { expect { create :shopping_list }.not_to raise_error }
end
