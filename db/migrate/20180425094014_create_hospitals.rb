class CreateHospitals < ActiveRecord::Migration[5.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :registration_id
      t.string :address
      t.string :phone
      t.string :email
      t.string :image
      t.string :gst_no

      t.timestamps
    end
  end
end
