# frozen_string_literal: true

module Api
  module V1
    class HomeController < ApplicationController
      def index
        @meals = Meal.all
      end
    end
  end
end
