class AddGenderToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :gender, :string
    add_column :employees, :dob, :date
    add_column :employees, :image, :string
  end
end
