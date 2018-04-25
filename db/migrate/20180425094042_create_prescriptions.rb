class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.string :prescription
      t.integer :duration
      t.references :attachments, foreign_key: true

      t.timestamps
    end
  end
end
