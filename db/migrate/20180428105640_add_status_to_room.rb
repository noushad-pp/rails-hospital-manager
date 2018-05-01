class AddStatusToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :occupied, :boolean
  end
end
