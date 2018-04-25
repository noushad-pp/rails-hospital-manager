class CreateAdmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :admissions do |t|
      t.references :patient, foreign_key: true
      t.date :admission_date
      t.date :discharge_date
      t.references :room, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
