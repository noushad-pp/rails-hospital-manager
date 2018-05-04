class AddBillToBillItems < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :billing_date, :date
    remove_reference :bills, :bill_items
    add_reference :bill_items, :bill, index: true
  end
end
