ActiveAdmin.register Product do

  menu parent: 'Food'
  permit_params :name, :calories

  index do
    selectable_column
    id_column
    column :name
    column :calories
    actions
  end

  filter :name
  filter :calories

  form do |f|
    f.inputs do
      f.input :name
      f.input :calories
    end
    f.actions
  end
end
