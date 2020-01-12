# frozen_string_literal: true

class ShoppingList < ApplicationRecord
  belongs_to :user

  has_many :shopping_list_product_associations
  has_many :products, through: :shopping_list_product_associations
end
