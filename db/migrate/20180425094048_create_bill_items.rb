class CreateBillItems < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_items do |t|
      t.string :type
      t.float :rate
      t.float :quantity
      t.float :amount

      t.timestamps
    end
  end
end
