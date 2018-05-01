ActiveAdmin.register Room do
  permit_params :id, :name, :room_type_id, :occupied

  index do
    selectable_column
    column :name
    bool_column :occupied
    column "Room Type" do |room|
      room.room_type.room_type
    end
    column "Details" do |room|
      room.room_type.room_type
    end
    column "Charge" do |room|
      room.room_type.charge
    end
    actions
  end
end
