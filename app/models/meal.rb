# frozen_string_literal: true

class Meal < ApplicationRecord
  paginates_per 25

  belongs_to :user
  belongs_to :meal_category

  has_many :meal_product_association
  has_many :comments
  has_many :recipes
  has_many :products, through: :meal_product_association, dependent: :destroy

  # has_many_attached :images
end
