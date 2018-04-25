class CreateTreatmentRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :treatment_records do |t|
      t.string :type
      t.references :patient, foreign_key: true
      t.references :admission, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :diagnosis, foreign_key: true
      t.references :prescription, foreign_key: true

      t.timestamps
    end
  end
end
