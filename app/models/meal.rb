# frozen_string_literal: true

class Meal < ApplicationRecord
  paginates_per 25

  belongs_to :user
  belongs_to :meal_category

  has_many :meal_product_association, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :meal_plans, dependent: :destroy
  has_many :products, through: :meal_product_association

  has_one_attached :image
end
