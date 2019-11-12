# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    include ::RenderStatuses

    rescue_from ActiveRecord::RecordNotUnique, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  end
end
