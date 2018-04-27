ActiveAdmin.register Department do
  permit_params :id, :name

  index do
    selectable_column
    column :name
    actions
  end
end
