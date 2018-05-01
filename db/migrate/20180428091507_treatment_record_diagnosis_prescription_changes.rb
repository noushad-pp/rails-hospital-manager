class TreatmentRecordDiagnosisPrescriptionChanges < ActiveRecord::Migration[5.1]
  def change
    remove_reference :treatment_records, :diagnosis
    remove_reference :treatment_records, :prescription
    add_reference :diagnoses, :treatment_record, index: true
    add_reference :prescriptions, :treatment_record, index: true
  end
end
