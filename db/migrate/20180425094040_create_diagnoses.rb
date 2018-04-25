class CreateDiagnoses < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnoses do |t|
      t.string :symptoms
      t.string :obserations
      t.references :attachments, foreign_key: true

      t.timestamps
    end
  end
end
