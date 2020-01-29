# frozen_string_literal: true

ActiveAdmin.register Meal do
  menu parent: 'Food'
  permit_params :name, :recipe, :time, :servings, :video, :calories, :fats, :proteins,
                :carbs, :description, :fats, :user_id, :meal_category_id, :rate, :image

  index do
    selectable_column
    id_column
    column :name
    column :time
    column :servings
    column :video
    column :calories
    column :fats
    column :proteins
    column :carbs
    column :description
    column :fats
    column :user_id
    column :meal_category_id
    column :rate
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :time
      f.input :servings
      f.input :video
      f.input :calories
      f.input :fats
      f.input :proteins
      f.input :carbs
      f.input :description
      f.input :fats
      f.input :user_id
      f.input :meal_category_id
      f.input :rate
      f.input :image, as: :file
    end
    f.actions
  end
end
