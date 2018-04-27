ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Admissions" do
          table_for Admission.order("id desc").limit(10) do
            column("Patient") { |admission| link_to(admission.patient_id, admin_user_path(patient)) }
            column("Admitted On") { |admission| admission.admission_date }
            column("Status") { |admission| admission.status }
          end

          if Admission.count == 0
            div class: "text-center" do
              "No admissions to show"
            end
          end
        end
      end

      column do
        panel "Rooms" do
          table_for Room.order("id desc").limit(10) do
            column("Room No") { |room| link_to(room.name, admin_user_path(room)) }
            column("Type") { |room| room.type }
            column("Status") { |room| room.status }
            column("Charge") { |room| room.charge }
          end

          if Room.count == 0
            div do
              "No items to show"
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Treatment Records" do
          table_for TreatmentRecord.order("id desc").limit(10) do
            column("Id") { |record| link_to(record.id, admin_user_path(treatment_record)) }
            column("Type") { |record| record.type }
            column("Patient") { |record| record.patient_id }
          end

          if TreatmentRecord.count == 0
            div class: "text-center" do
              "No records to show"
            end
          end
        end
      end
    end
  end # content
end
