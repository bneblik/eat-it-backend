# frozen_string_literal: true

ActiveAdmin.register Meal do
  menu parent: 'Food'
  permit_params :name, :recipe

  index do
    selectable_column
    id_column
    column :name
    column :recipe
    actions
  end

  filter :name
  filter :recipe

  form do |f|
    f.inputs do
      f.input :name
      f.input :recipe
    end
    f.actions
  end
end
