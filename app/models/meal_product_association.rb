# frozen_string_literal: true

class MealProductAssociation < ApplicationRecord
  belongs_to :meal
  belongs_to :product
end
