# frozen_string_literal: true

class Meal < ApplicationRecord
  has_many :meal_product_association
  has_many :products, through: :meal_product_association, dependent: :destroy

  has_many_attached :images
end
