# frozen_string_literal: true

class User < ApplicationRecord
  has_one :fridge
  has_many :meals
  has_many :comments
end
