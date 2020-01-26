# frozen_string_literal: true

class Meal < ApplicationRecord
  paginates_per 25

  belongs_to :user

  has_many :meal_product_association
  has_many :comments
  has_many :products, through: :meal_product_association, dependent: :destroy

  has_one :meal_category
  # has_many_attached :images
end
