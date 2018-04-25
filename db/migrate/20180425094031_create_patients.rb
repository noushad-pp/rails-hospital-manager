class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :phone
      t.string :address
      t.date :dob
      t.string :image

      t.timestamps
    end
  end
end
