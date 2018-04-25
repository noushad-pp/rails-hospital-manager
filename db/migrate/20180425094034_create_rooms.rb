class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :type
      t.string :room_type
      t.float :charge

      t.timestamps
    end
  end
end
