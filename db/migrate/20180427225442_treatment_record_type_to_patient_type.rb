class TreatmentRecordTypeToPatientType < ActiveRecord::Migration[5.1]
  def change
    rename_column :treatment_records, :type, :treatment_type
    add_column :treatment_records, :treatment_date, :date
  end
end
