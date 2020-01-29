# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ::Api::BaseController
      def index
        @products = Product.all.page params[:page]
        @products = @products.where('name like ?', "%#{params[:check]}%") unless params[:check].nil?
        @products = @products.page params[:page]
        render json: Api::V1::ProductSerializer.new(@products).serialized_json
      end

      def show
        @product = Product.find(params[:id])
        render json: Api::V1::ProductSerializer.new(@product).serialized_json
      end

      def create
        @product = Product.new(product_params)
        render json: Api::V1::ProductSerializer.new(@product).serialized_json
      end

      private

      def product_params
        params.require(:product).permit(:product_id, :products, :image, uploads: [])
      end
    end
  end
end
