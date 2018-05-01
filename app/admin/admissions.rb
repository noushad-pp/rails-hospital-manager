ActiveAdmin.register Admission do
  permit_params :patient_id, :room_id, :admission_date, :discharge_date, :status

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :patient
      f.input :room, :collection => f.object.new_record? ? Room.unassigned_rooms : Array.new(Room.unassigned_rooms).push(f.object.room)
      f.input :admission_date
      unless f.object.new_record?
        f.input :discharge_date
      end
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column :patient
    column :room
    column :admission_date
    column :discharge_date
    actions
  end
end
