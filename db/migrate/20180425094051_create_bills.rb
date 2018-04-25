class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.references :patient, foreign_key: true
      t.integer :total
      t.string :payment_status
      t.float :discount
      t.float :tax
      t.references :bill_items, foreign_key: true

      t.timestamps
    end
  end
end
