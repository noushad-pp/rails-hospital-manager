ActiveAdmin.register EmployeeRole do
  permit_params :id, :name, :department_id

  index do
    selectable_column
    column :name
    column "Department" do |room|
      room.department.name
    end
    actions
  end
end
