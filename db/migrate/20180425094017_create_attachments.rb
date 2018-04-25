class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.string :url
      t.string :title
      t.references :attachable, polymorphic: true

      t.timestamps
    end
  end
end
