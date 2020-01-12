# frozen_string_literal: true

class Fridge < ApplicationRecord
  belongs_to :user
  has_many :fridge_product_associations
  has_many :products, through: :fridge_product_associations
end
