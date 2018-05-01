class AddFeildsToBillItems < ActiveRecord::Migration[5.1]
  def change
    add_column :bill_items, :title, :string
    add_column :bill_items, :description, :string
    add_column :bill_items, :discount, :float
    rename_column :bill_items, :type, :bill_type
  end
end
