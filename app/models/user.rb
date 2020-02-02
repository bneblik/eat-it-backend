# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  enum gender: { man: 0, woman: 1 }

  has_one :fridge, dependent: :destroy
  has_one :shopping_list, dependent: :destroy

  has_many :meals, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :meal_plans, dependent: :destroy
end
