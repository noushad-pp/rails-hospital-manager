class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.references :department, foreign_key: true
      t.string :employee_type
      t.string :degrees
      t.string :registration_no
      t.float :consultation_charge
      t.string :address
      t.string :phone
      t.string :email
      t.references :employee_role, foreign_key: true
      t.date :joining_date
      t.date :leaving_date
      t.float :salary
      t.string :additional_info

      t.timestamps
    end
  end
end
