# frozen_string_literal: true

class ShoppingListProductAssociation < ApplicationRecord
  has_one :product
  has_one :shopping_list
end
