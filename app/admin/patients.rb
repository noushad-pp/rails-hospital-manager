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
end
