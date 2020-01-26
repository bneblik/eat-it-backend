# frozen_string_literal: true

class FridgeProductAssociation < ApplicationRecord
  belongs_to :fridge
  belongs_to :product
end
