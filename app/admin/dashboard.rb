ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "Quick Actions" do
          table :class => "quick-actions-table" do
            tr do
              td do
                "Patient Registration"
              end
              td do
                link_to 'Register Patient', admin_patient_path("new"), :class => "btn-submit"
              end
            end
            tr do
              td do
                "Patient Admission"
              end
              td do
                link_to 'Admit Patient', admin_admission_path("new"), :class => "btn-submit"
              end
            end
            tr do
              td do
                "Patient Bill"
              end
              td do
                link_to 'Add Bill', admin_bill_path("new"), :class => "btn-submit"
              end
            end
            tr do
              td do
                "Patient Treatment Record"
              end
              td do
                link_to 'Add Record', admin_treatment_record_path("new"), :class => "btn-submit"
              end
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Latest Treatment Records" do
          table_for TreatmentRecord.order("id desc").limit(10) do
            column("Id") { |record| link_to(record.id, admin_treatment_record_path(record)) }
            column("Admission Type") { |record| record.treatment_type }
            column("Doctor") { |record| link_to(record.employee.name, admin_employee_path(record.employee)) }
            column("Patient") { |record| link_to(record.patient.name, admin_patient_path(record.patient)) }
          end

          if TreatmentRecord.count == 0
            div class: "text-center" do
              "No records to show"
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Recent Admissions" do
          table_for Admission.order("id desc").limit(10) do
            column("Patient") { |admission| link_to(admission.patient.name, admin_patient_path(admission.patient)) }
            column("Room") { |admission| link_to(admission.room.name, admin_room_path(admission.room)) }
            column("Admitted On") { |admission| admission.admission_date }
            column("Discharged") { |admission| admission.discharge_date.present?  ? admission.discharge_date: "Not Discharged"}
          end

          if Admission.count == 0
            div class: "text-center" do
              "No admissions to show"
            end
          end
        end
      end

      column do
        panel "Latest Room Status" do
          table_for Room.order("id desc").limit(10) do
            column("Room No") { |room| link_to(room.name, admin_room_path(room)) }
            column("Type") { |room| room.room_type.room_type }
            column("Status") { |room| room.occupied == true ? "Occupied" : "Free" }
            column("Charge") { |room| room.room_type.charge }
          end

          if Room.count == 0
            div do
              "No items to show"
            end
          end
        end
      end
    end

  end # content
end
