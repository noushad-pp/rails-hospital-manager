ActiveAdmin.register Patient do
  permit_params :id, :name, :email, :gender, :phone, :address, :dob, :image

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :email, as: :email
      f.input :gender, :as => :select, :collection => [ 'MALE', 'FEMALE', 'OTHER'], :selected => "MALE"
      f.input :phone
      f.input :address, :input_html => { :rows => 5 }
      f.input :dob, as: :date_time_picker
      f.input :image, as: :file, :hint => f.object.image.present? ? image_tag(f.object.image.url(:big_thumb)) : content_tag(:span)
    end

    f.actions
  end

  index do
    selectable_column
    column "Patient No"  do |patient| patient.id end
    column :name
    column :gender
    column :address
    column :phone
    column :email
    column :image do |patient|
      image_tag patient.image.url(:thumb)
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :gender
      row :email
      row :phone
      row :address
      row :dob
      row :image do |patient|
        image_tag patient.image.url(:big_thumb)
      end
    end
  end

  filter :name
  filter :phone
  filter :address
  filter :email
  filter :dob
end
