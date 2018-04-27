ActiveAdmin.register RoomType do
  permit_params :id, :name, :description, :room_type, :charge

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :description, :input_html => { :rows => 5 }
      f.input :room_type
      f.input :charge
    end

    f.actions
  end

  filter :name
  filter :room_type
  filter :charge

  index do
    selectable_column
    column :name
    column :description do |object|
      object.description.slice(0, 100)
    end
    column :room_type
    column :charge
    actions
  end

end
