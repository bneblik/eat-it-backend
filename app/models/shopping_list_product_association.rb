# frozen_string_literal: true

class ShoppingListProductAssociation < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_list
end
