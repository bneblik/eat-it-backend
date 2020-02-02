# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ::Api::BaseController
      def index
        @products = Product.all.page params[:page]
        @products = @products.where('lower(name) like ?', "%#{params[:check].downcase}%") unless params[:check].nil?
        @products = @products.page params[:page]
        render json: Api::V1::ProductSerializer.new(@products).serialized_json
      end

      def show
        @product = Product.find(params[:id])
        render json: Api::V1::ProductSerializer.new(@product).serialized_json
      end
    end
  end
end
