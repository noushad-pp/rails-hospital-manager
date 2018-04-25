class CreateBillTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :bill_templates do |t|
      t.string :title
      t.string :subtitle
      t.string :image
      t.string :gst_no

      t.timestamps
    end
  end
end
