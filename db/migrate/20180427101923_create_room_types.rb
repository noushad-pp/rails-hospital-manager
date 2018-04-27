class CreateRoomTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :room_types do |t|
      t.string :name
      t.text :description
      t.string :room_type
      t.float :charge

      t.timestamps
    end
  end
end
