# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :meal
  belongs_to :user
end
