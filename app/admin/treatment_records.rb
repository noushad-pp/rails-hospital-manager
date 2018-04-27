ActiveAdmin.register TreatmentRecord do
  permit_params :id, :patient_id, :admission_id, :employee_id, :treatment_type, :treatment_date,
                diagnosis_attributes:[:symptoms, :obserations, :id, :_destroy, attachments_attributes: [:url, :id, :_destroy]],
                prescription_attributes:[:prescription, :duration,  :id, :_destroy, attachments_attributes: [:url, :id, :_destroy]]

  form do |f|
    f.inputs do
      f.input :treatment_type, :collection => ['IP', 'OP'], :selected => "IP"
      f.input :patient
      f.input :admission
      f.input :employee,  label: "Consulting Doctor", :collection => Employee.all.select {|employee|  employee.employee_role.name.downcase == 'doctor' }
      f.input :treatment_date
    end

    f.inputs "Diagnosis", for: [:diagnosis, f.object.diagnosis || Diagnosis.new] do |diagnosis|
      diagnosis.input :symptoms, :input_html => { :rows => 5 }
      diagnosis.input :observations, :input_html => { :rows => 5 }
      diagnosis.has_many :attachments, heading: 'Diagnosis documents', allow_destroy: true, new_record: "Add new file" do |attachment|
        attachment.input :url, as: :file, :hint => attachment.object.url.present? ? link_to(attachment.object.url, attachment.object.url) : content_tag(:span)
      end
    end


    f.inputs "Prescription", for: [:prescription, f.object.prescription || Prescription.new] do |prescription|
      prescription.input :prescription, :input_html => { :rows => 5 }
      prescription.input :duration, label: "Duration (days)"
      prescription.has_many :attachments, heading: 'Prescriptions documents', allow_destroy: true, new_record: "Add new file" do |attachment|
        attachment.input :url, as: :file, :hint => attachment.object.url.present? ? link_to(attachment.object.url, attachment.object.url) : content_tag(:span)
      end
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column :patient
    column :admission
    column :diagnosis do |record|
      record.diagnosis.id
    end
    column :prescription do |record|
      record.prescription.id
    end
    actions
  end
end
