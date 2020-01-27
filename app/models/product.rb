# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :meal_product_association
  has_many :meals, through: :meal_product_association, dependent: :destroy

  has_many :fridge_product_associations
  has_many :fridges, through: :fridge_product_associations

  has_many :shopping_list_product_associations
  has_many :shopping_lists, through: :shopping_list_product_associations

  has_many_attached :images
  belongs_to :product_category
end
