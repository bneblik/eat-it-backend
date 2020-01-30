# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  enum gender: { man: 0, woman: 1 }

  has_one :fridge
  has_one :shopping_list

  has_many :meals
  has_many :comments
  has_many :meal_plans
end
