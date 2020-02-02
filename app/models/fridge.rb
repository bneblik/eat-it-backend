# frozen_string_literal: true

class Fridge < ApplicationRecord
  alias_attribute :fridge_products, :fridge_product_associations

  belongs_to :user
  has_many :fridge_product_associations, dependent: :destroy
  has_many :products, through: :fridge_product_associations
end
