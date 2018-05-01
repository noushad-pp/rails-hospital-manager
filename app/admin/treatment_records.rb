ActiveAdmin.register TreatmentRecord do
  permit_params :id, :patient_id, :admission_id, :employee_id, :treatment_type, :treatment_date,
                diagnosis_attributes:[:symptoms, :observations, :id, :_destroy, attachments_attributes: [:url, :id, :_destroy]],
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
        attachment.input :url, label: "Attachment", as: :file, :hint => attachment.object.url.present? ?  link_to(attachment.object.url, attachment.object.url.to_s) : content_tag(:span)
      end
    end

    f.inputs "Prescription", for: [:prescription, f.object.prescription || Prescription.new] do |prescription|
      prescription.input :prescription, :input_html => { :rows => 5 }
      prescription.input :duration, label: "Duration (days)"
      prescription.has_many :attachments, heading: 'Prescriptions documents', allow_destroy: true, new_record: "Add new file" do |attachment|
        attachment.input :url, label: "Attachment", as: :file, :hint => attachment.object.url.present? ? link_to(attachment.object.url, attachment.object.url.to_s) : content_tag(:span)
      end
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column :patient
    column :treatment_type
    column "Doctor" do |record|
      record.employee
    end
    column :admission
    column :treatment_date

    actions
  end

  show do
    tabs do
      tab 'Diagnosis' do
        attributes_table do
          row "Symptoms" do |record|
            record.diagnosis.symptoms
          end
          row "Observations" do |record|
            record.diagnosis.observations
          end
        end

        table_for treatment_record.diagnosis.attachments do
          column "Attachments" do |attachment|
            link_to attachment.url, attachment.url.to_s
          end
        end
      end

      tab 'Prescription' do
        attributes_table do
          row "Prescription" do |record|
            record.prescription.prescription
          end
          row "Course Duration" do |record|
            record.prescription.duration
          end
        end

        table_for treatment_record.prescription.attachments do
          column "Attachments" do |attachment|
            link_to attachment.url, attachment.url.to_s
          end
        end
      end
    end
  end

  sidebar "Details", only: :show do
    attributes_table_for treatment_record do
      row :patient
      row :treatment_type
      row "Doctor" do |record|
        record.employee
      end
      row "Admission" do |record|
        record.admission
      end
      row :treatment_date
    end
  end
end
