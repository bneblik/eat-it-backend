# frozen_string_literal: true

class ShoppingList < ApplicationRecord
  alias_attribute :shopping_list_products, :shopping_list_product_associations

  belongs_to :user
  has_many :shopping_list_product_associations, dependent: :destroy
  has_many :products, through: :shopping_list_product_associations
end
