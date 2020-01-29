# frozen_string_literal: true

ActiveAdmin.register Product do
  menu parent: 'Food'
  permit_params :name, :calories, :fats, :carbs, :proteins, :unit, :product_category_id, :image

  index do
    selectable_column
    id_column
    column :name
    column :calories
    column :fats
    column :carbs
    column :proteins
    column :unit
    column :product_category_id
    actions
  end

  filter :name
  filter :calories

  form do |f|
    f.inputs do
      f.input :name
      f.input :calories
      f.input :fats
      f.input :carbs
      f.input :proteins
      f.input :unit
      f.input :product_category_id, as: :select, collection: ProductCategory.all.order(:name).pluck(:name, :id)
      f.input :image, as: :file
    end
    f.actions
  end
end
