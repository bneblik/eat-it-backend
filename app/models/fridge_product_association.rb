# frozen_string_literal: true

class FridgeProductAssociation < ApplicationRecord
  has_one :fridge
  has_one :product
end
