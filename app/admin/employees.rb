ActiveAdmin.register Employee do
  permit_params :id, :name, :employee_role_id, :department_id, :employee_type, :phone, :address, :email, :gender, :additional_info, :degrees, :consultation_charge, :registration_no, :joining_date, :leaving_date, :dob, :salary, :image

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :department
      f.input :employee_role
      f.input :employee_type, :as => :select, :collection => Employee::EMPLOYEE_TYPE, :selected => Employee::EMPLOYEE_TYPE[0]
      f.input :name
      f.input :email, as: :email
      f.input :gender, :as => :select, :collection => Employee::GENDER, :selected => Employee::GENDER[0]
      f.input :phone
      f.input :address, :input_html => { :rows => 5 }
      f.input :dob, as: :date_time_picker
      f.input :joining_date, as: :date_time_picker
      f.input :leaving_date, as: :date_time_picker
      f.input :salary
      f.input :consultation_charge
      f.input :image, as: :file, :hint => f.object.image.present? ? image_tag(f.object.image.url(:big_thumb)) : content_tag(:span)
      f.input :additional_info, :input_html => { :rows => 5 }
    end

    f.actions
  end

  index do
    selectable_column
    column :name
    column :department
    column :employee_role
    column :employee_type
    column :phone
    column :email
    column :image do |employee|
      image_tag employee.image.url(:thumb)
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
      row :degrees
      row :department
      row :employee_role
      row :employee_type
      row :salary
      row :consultation_charge
      row :joining_date
      row :leaving_date
      row :additional_info
      row :image do |patient|
        image_tag patient.image.url(:big_thumb)
      end
    end
  end

  filter :department
  filter :employee_role
  filter :name
  filter :phone
  filter :address
  filter :email
  filter :dob
  filter :address
  filter :salary
  filter :joining_date
  filter :leaving_date

end
