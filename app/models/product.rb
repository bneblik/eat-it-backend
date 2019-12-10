# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :meal_product_association
  has_many :meals, through: :meal_product_association, dependent: :destroy

  has_many_attached :images
end
